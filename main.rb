require 'sinatra/reloader'
require 'sinatra'
require 'pg' #pg allows ruby to do sql


def run_sql(sql)      #this is the function to get the database going
  db= PG.connect(dbname: 'goodfoodhunting')
  results = db.exec(sql)
  db.close
  return results
end



#list all dish
get '/' do  #this is the router page.. the 'request'
  @dishes = run_sql('SELECT * FROM dishes;')
  erb :index
end

get '/dishes/new' do
  erb :new
end

post '/dishes' do
  db = PG.connect(dbname: 'goodfoodhunting')
  sql = "INSERT INTO dishes (name, image_url) VALUES('#{  params[:name]}', '#{  params[:image_url] }');"

  # raise sql
  db.exec(sql)
  redirect to '/'

end


get '/food_info/:id' do
  db = PG.connect(dbname: 'goodfoodhunting')
  sql ="select * from dishes where id = #{params[:id]};"
  results= db.exec(sql)
  @dish = results[0]
  erb :food_info
end

#update existing dish

get '/food_info/:id/edit' do
  sql = "select * from dishes where id = #{params[:id]};"
  results = run_sql(sql) #database returns a collection (an array) always
  @dish = results.first
  erb :edit

end


#update existing dish
put '/dishes/:id' do
  #update existing dish from database.
    sql = "UPDATE dishes SET name = '#{params[:name]}', image_url ='#{params[:image_url]}'
    WHERE id = #{params[:id]};"
  run_sql(sql)
  redirect to '/'
end
