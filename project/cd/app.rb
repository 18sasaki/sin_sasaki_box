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
  redirect "/cd/#{params[:name]}"
end

get '/cd/:name' do
  if @artist = Artists.find_by_name(params[:name])
    @cds = Cds.where(artist_id: @artist).order('release_date')
    erb :'cd/artist_show'
  else
    @new_name = params[:name]
    erb :'cd/artist_register'
  end
end

# ↑ここまで見直し済み

# アーティスト編集
get '/cd/:name/edit' do
  @artist = Artists.find_by_name(params[:name])
  erb :'cd/artist_edit'
end

# アーティスト更新
post '/cd/:name/update' do
  artists.find(params[:id]).insert_data(params)
  redirect "/cd/artists/"
end

# アーティスト削除
delete '/cd/:name/del' do
  artists.find(params[:id]).destroy
  redirect "/cd/artists/"
end


# cd登録
get '/cd/:name/add_cd' do
  @artist = Artists.find_by_name(params[:name])
  erb :'cd/add_cd'
end

post '/cd/:name/add_cd' do
  Cds.new.insert_data(params)
  redirect "/cd/#{ERB::Util.url_encode(params[:name])}"
end

# cd編集
post '/cd/:name/update_cd' do
  Cds.find(params[:cd_id]).insert_data(params)
  redirect "/cd/#{params[:name]}"
end

# cd削除
delete '/cd/:name/del_cd' do
  Cds.find(params[:cd_id]).destroy
  redirect "/cd/#{params[:name]}"
end


# type
# は、後回し
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
