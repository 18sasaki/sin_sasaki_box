
class GConfigs < ActiveRecord::Base
  default_scope { order('name COLLATE "C"') } if ENV["RACK_ENV"] == "production"

  Required = ['artist_id_list', 'type_id', 'start_date', 'end_date', 'date_range']

  def overwrite(params)
    self.artist_id_list = params[:artist_id_list]
    self.type_id        = params[:type_id]
    self.start_date     = params[:start_date]
    self.end_date       = params[:end_date]
    self.date_range     = params[:date_range]
    self.save
  end
end
