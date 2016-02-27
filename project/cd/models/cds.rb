
class Cds < ActiveRecord::Base
  default_scope { order('name COLLATE "C"') } if ENV["RACK_ENV"] == "production"

  Required = ['title', 'artist_id', 'type_id', 'release_date']

  def self.get_all
    Cds.all.order('release_date')
  end

  def insert_data(params)
    self.title        = params[:title]
    self.artist_id    = params[:artist_id]
    self.type_id      = params[:type_id]
    self.release_date = params[:release_date]
    self.save
  end
end
