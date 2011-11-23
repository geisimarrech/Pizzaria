class Status < ActiveRecord::Base
  set_table_name "status"

  has_many :orders, :foreign_key => "status_id"
end