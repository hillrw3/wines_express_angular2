require 'httparty'

class Runner
  @@pid = nil
  @@frontend_pid = nil

  API_PORT=3001
  FRONTEND_PORT=4201

  def self.run_feature
    @@pid = Process.spawn("cd ../server/ && API_PORT=#{API_PORT} npm start", {pgroup: true})
    @@frontend_pid = Process.spawn("cd ../client/ && ng serve --env=test --port=#{FRONTEND_PORT}", {pgroup: true})

    number_of_attempts = 0
    while number_of_attempts < 10
      begin
        response = HTTParty.get("http://localhost:#{API_PORT}/ping") # hit the ping endpoint
        frontend_response = HTTParty.get("http://localhost:#{FRONTEND_PORT}")

        break if response.code == 200 && frontend_response.code == 200 # success!
      rescue Errno::ECONNREFUSED # rescue only if the exception is a failure to connect
        number_of_attempts += 1
        sleep 0.5
      end

      raise 'Failed to start api server' if number_of_attempts == 10
    end
  end

  def self.run_api
    @@pid = Process.spawn("cd ../server/ && API_PORT=#{API_PORT} npm start", {pgroup: true})

      number_of_attempts = 0
      while number_of_attempts < 10
        begin
          response = HTTParty.get("http://localhost:#{API_PORT}/ping") # hit the ping endpoint

          break if response.code == 200 # success!
        rescue Errno::ECONNREFUSED # rescue only if the exception is a failure to connect
          number_of_attempts += 1
          sleep 0.5
        end

        raise 'Failed to start api server' if number_of_attempts == 10
      end
  end

  def self.stop
    # kill the processes
    Process.kill(-9, @@pid) if @@pid
    Process.kill(-9, @@frontend_pid) if @@frontend_pid
  end
end