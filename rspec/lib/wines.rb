require 'active_record'

class Wines < ActiveRecord::Base
  self.table_name = 'wines'
end