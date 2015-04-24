require "sinatra"
require "sinatra/activerecord"
require "shotgun"

set :database,"sqlite3:mydb.sqlite3"

class Donnees <ActiveRecord::Base
end

# It might be ... usefull? 
get '/?' do
	redirect '/todo'
end

# get the to do list
get '/todo' do
	@mydata = Donnees.order("created_at DESC") #get task in order (you also can just use ".all")
	erb :todo
end

# add task in DB
post '/todo' do
	Donnees.create(params)
    redirect "/"
end

# get the task edited
get '/edit/:id' do
	@donnees = Donnees.find(params[:id])
	erb :edit
end

# edit the task with id in DB
put '/todo/:id' do
	@donnees = Donnees.find(params[:id]) #get the ID
	@donnees.content = params[:content] #get the param you wanna edit
	 if @donnees.save #then save it
      redirect "/"
    else
      erb :edit
    end
end

# get the task deleted
get '/delete/:id' do
	@donnees = Donnees.find(params[:id])
	erb :delete
end

#delete the task in DB
delete '/delete/:id' do
	Donnees.find(params[:id]).destroy #destroy the task
	redirect '/'
end






