
class Artists < ActiveRecord::Base
  default_scope { order('name COLLATE "C"') } if ENV["RACK_ENV"] == "production"

  Required = ['name', 'name_view', 'name_kana', 'rgb', 'sex', 'type_id']

  def self.get_all
    Artists.all.order('name_kana')
  end

  def insert_data(params)
    self.name      = params[:name]
    self.name_view = params[:name_view]
    self.name_kana = params[:name_kana]
    self.rgb       = params[:rgb]
    self.sex       = params[:sex]
    self.type_id   = params[:type_id]
    self.save
  end
end
