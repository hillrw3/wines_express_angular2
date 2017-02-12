require 'active_record'

# DB_CREDS = {'uri' => ENV.fetch('DATABASE_URL', "postgresql://localhost:5432/wine")}
#
# db_uri = URI(DB_CREDS['uri'])
# db_uri.query
# query_params = URI.decode_www_form db_uri.query.to_s
# db_uri.query = URI.encode_www_form(query_params + [['pool', ENV.fetch('DBPOOL', 2)]])
# ActiveRecord::Base.establish_connection(db_uri.to_s)

ActiveRecord::Base.establish_connection(
                    adapter: 'postgresql',
                    host: 'localhost',
                    database: 'wine'
)