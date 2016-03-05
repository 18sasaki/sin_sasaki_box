
class Cds < ActiveRecord::Base
  default_scope { order('name COLLATE "C"') } if ENV["RACK_ENV"] == "production"

  Required = ['title', 'artist_id', 'type_id', 'release_date']

  def self.get_all
    Cds.all.order('release_date')
  end

  def self.insert_from_csv(params)
    CSV.foreach(params[:csv]) do |param_list|
      Cds.new.insert_data(list_to_hash(params[:artist_id], param_list))
    end
  end

  def self.list_to_hash(artist_id, param_list)
    # [ release_date, title ]
    {
      title:        param_list[1]
      artist_id:    artist_id
      # type_id:      1
      release_date: param_list[0]
    }
  end

  def insert_data(params)
    self.title        = params[:title]
    self.artist_id    = params[:artist_id]
    # self.type_id      = params[:type_id]
    # 現時点では全部１にしておく
    self.type_id      = 1
    self.release_date = params[:release_date]
    self.save
  end

  # def insert_data_2(artist_id, param_list)
  #   self.title        = param_list[1]
  #   self.artist_id    = artist_id
  #   # self.type_id      = params[:type_id]
  #   # 現時点では全部１にしておく
  #   self.type_id      = 1
  #   self.release_date = param_list[0]
  #   self.save
  # end
end
