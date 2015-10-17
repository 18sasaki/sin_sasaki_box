# top
get '/cd' do
  redirect '/cd/'
end

get '/cd/' do
  erb :'cd/index'
end

# artist
get '/artists' do
  redirect '/artists/'
end

get '/artists/' do
  erb :'cd/index'
end

post '/artists/create' do
  Artists.new.insert_data(params)
  redirect "/artists/"
end

get '/:name' do |n|
  @artist = Artists.find_by_name(params[:name])
  erb :artist_show
end

get '/:name/edit' do
  @artist = Artists.find_by_name(params[:name])
  erb :artist_edit
end

post '/:name/update' do
  artists.find(params[:id]).insert_data(params)
  redirect "/artists/"
end

delete '/:name/del' do
  artists.find(params[:id]).destroy
  redirect "/artists/"
end


# cd
get '/:name/:title' do
  redirect '/:name/:title/'
end

get '/:name/:title/' do
  @cd = Cds.find_by_name_and_title(params[:name], params[:title])
  erb :cd_show
end

get '/:name/register' do
  @artist = Artists.find_by_name(params[:name])
  erb :cd_new
end

post '/:name/register' do
  Cds.register(params)
  redirect "/#{params[:name]}/"
end

get '/:name/:title/edit' do
  @cd = Cds.find_by_name_and_title(params[:name], params[:title])
  erb :cd_edit
end

post '/:name/:title/update' do
  Cds.find_by_name_and_title(params[:name], params[:title]).insert_data(params)
  redirect "/#{params[:name]}/"
end

delete '/:name/:title/del' do
  Cds.find_by_name_and_title(params[:name], params[:title]).destroy
  redirect '/#{params[:name]}/'
end


# type
get '/type' do
  redirect '/type/'
end

get '/type/' do
  @types = Types.get_all
  erb :type_index
end

get '/type/new' do
  erb :type_new
end

post '/type/create' do
  Types.new.insert_data(params)
  redirect '/type/'
end

get '/type/edit' do
  @type = Types.find(params[:id])
  erb :type_index
end

post '/type/update' do
  Types.find(params[:id]).insert_data(params)
  redirect '/type/'
end

delete '/type/del' do
  Types.find(params[:id]).destroy
  redirect '/type/'
end

