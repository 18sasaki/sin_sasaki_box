# top
get '/cd' do
  redirect '/cd/'
end

get '/cd/' do
  erb :'cd/index'
end

# artist
get '/cd/artists' do
  redirect '/artists/'
end

get '/cd/artists/' do
  erb :'cd/index'
end

post '/cd/cd/artists/create' do
  Artists.new.insert_data(params)
  redirect "/artists/"
end

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
  redirect "/artists/"
end

delete '/cd/:name/del' do
  artists.find(params[:id]).destroy
  redirect "/artists/"
end


# cd
get '/cd/:name/:title' do
  redirect '/:name/:title/'
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
  redirect "/#{params[:name]}/"
end

get '/cd/:name/:title/edit' do
  @cd = Cds.find_by_name_and_title(params[:name], params[:title])
  erb :'cd/cd_edit'
end

post '/cd/:name/:title/update' do
  Cds.find_by_name_and_title(params[:name], params[:title]).insert_data(params)
  redirect "/#{params[:name]}/"
end

delete '/cd/:name/:title/del' do
  Cds.find_by_name_and_title(params[:name], params[:title]).destroy
  redirect '/#{params[:name]}/'
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
  redirect '/type/'
end

get '/cd/type/edit' do
  @type = Types.find(params[:id])
  erb :'cd/type_index'
end

post '/cd/type/update' do
  Types.find(params[:id]).insert_data(params)
  redirect '/type/'
end

delete '/cd/type/del' do
  Types.find(params[:id]).destroy
  redirect '/type/'
end

