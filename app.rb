require 'sinatra'
require 'uri'
require './Models/Customer.rb'

get '/' do   # root path
   erb :welcome   # loads a template file from the views Folder to render
end

get "/menu" do #menu path
   erb :menu
end
get "/new" do #order path
  erb :new
end


get '/:title' do
  @title = params[:title]  #params allowes you to subsitute any strings you want as part of there request path that string is then be accesible with in the sinatra route
  @content = Customer.page_content(@title) #reads contents with the same
  erb :show
end

get "/:title/edit" do

  @title = params[:title]
  @content = Customer.page_content(@title)
  erb :edit
end

post "/create" do  #create
   Customer.save_content(params["title"],
                         params["comment"],
                         params["date"],
                         params["starter"],
                         params["main"],
                         params["dessert"],
                         params["drink"])

  redirect URI.escape"/#{params["title"]}"# encodes the space characters tot he browser
end

put "/:title" do
  Customer.save_content(params["title"],
                       params["comment"],
                       params["date"],
                       params["starter"],
                       params["main"],
                       params["dessert"],
                       params["drink"])
                       
  redirect URI.escape"/#{params["title"]}"
end

delete "/:title" do
    Customer.delete_content(params[:title])
    redirect "/"
end
