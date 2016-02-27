
class Types < ActiveRecord::Base
  default_scope { order('name COLLATE "C"') } if ENV["RACK_ENV"] == "production"

  Required = ['key', 'view_name']

  def self.get_all
    Types.find_by_key('cd')
  end

  def insert_data(params)
    self.key       = params[:key]
    self.view_name = params[:view_name]
    self.save
  end
end
