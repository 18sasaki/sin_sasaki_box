# top
get '/cd' do
  redirect '/cd/'
end

get '/cd/' do
  erb :'cd/index'
end

# artist
get '/cd/artists' do
  redirect '/cd/artists/'
end

get '/cd/artists/' do
  @artists = Artists.get_all
  erb :'cd/artists'
end

get '/cd/artist_register/:name?' do
  erb :'cd/artist_register'
end

post '/cd/artist_register/' do
  Artists.new.insert_data(params)
  redirect "/cd/artists/"
end

# ↑ここまで見直し済み

get '/cd/:name' do
  if @artist = Artists.find_by_name(params[:name])
    # erb :'cd/artist_show'
    erb :'cd/dummy'
  else
    @new_name = params[:name]
    # erb :'cd/artist_register'
    erb :'cd/dummy'
  end
end

get '/cd/:name/edit' do
  @artist = Artists.find_by_name(params[:name])
  erb :'cd/artist_edit'
end

post '/cd/:name/update' do
  artists.find(params[:id]).insert_data(params)
  redirect "/cd/artists/"
end

delete '/cd/:name/del' do
  artists.find(params[:id]).destroy
  redirect "/cd/artists/"
end


# cd
get '/cd/:name/:title' do
  redirect '/cd/:name/:title/'
end

get '/cd/:name/:title/' do
  @cd = Cds.find_by_name_and_title(params[:name], params[:title])
  erb :'cd/cd_show'
end

get '/cd/:name/register' do
  @artist = Artists.find_by_name(params[:name])
  erb :'cd/cd_new'
end

post '/cd/:name/register' do
  Cds.register(params)
  redirect "/cd/#{params[:name]}/"
end

get '/cd/:name/:title/edit' do
  @cd = Cds.find_by_name_and_title(params[:name], params[:title])
  erb :'cd/cd_edit'
end

post '/cd/:name/:title/update' do
  Cds.find_by_name_and_title(params[:name], params[:title]).insert_data(params)
  redirect "/cd/#{params[:name]}/"
end

delete '/cd/:name/:title/del' do
  Cds.find_by_name_and_title(params[:name], params[:title]).destroy
  redirect '/cd/#{params[:name]}/'
end


# type
get '/cd/type' do
  redirect '/type/'
end

get '/cd/type/' do
  @types = Types.get_all
  erb :'cd/type_index'
end

get '/cd/type/new' do
  erb :'cd/type_new'
end

post '/cd/type/create' do
  Types.new.insert_data(params)
  redirect '/cd/type/'
end

get '/cd/type/edit' do
  @type = Types.find(params[:id])
  erb :'cd/type_index'
end

post '/cd/type/update' do
  Types.find(params[:id]).insert_data(params)
  redirect '/cd/type/'
end

delete '/cd/type/del' do
  Types.find(params[:id]).destroy
  redirect '/cd/type/'
end

helpers do
  def type_hash
    { '0' => '', '1' => '声優', '2' => 'アニソン歌手', '3' => '声優ユニット' }
  end

  def type_translate(type_int)
    type_hash[type_int.to_s]
  end
end
