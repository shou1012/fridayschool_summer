require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'

get '/' do
  @mikito_tasks =Task.where(name: "みきと")
  @chahan_tasks =Task.where(name: "ちゃーはん")
  @karen_tasks = Task.where(name: "かれん")
  @hayato_tasks = Task.where(name: "はやと")
  @hayato_time = Task.where(name: "はやと").sum(:time)
  @mikito_time = Task.where(name: "みきと").sum(:time)
  @karen_time = Task.where(name: "かれん").sum(:time)
  @chahan_time = Task.where(name: "ちゃーはん").sum(:time)
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  @task = Task.create(name: params[:name], title: params[:title], time: params[:time], comment: params[:comment])
  if @task.persisted?
    redirect '/'
  else
    redirect '/new'
  end
end