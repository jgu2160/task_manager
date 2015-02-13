class TaskManagerApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    TaskManager.database
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.database
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  put '/tasks/:id' do |id|
    TaskManager.database
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  get '/tasks/:id' do |id|
    TaskManager.database
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id|
    TaskManager.database
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  delete '/tasks/:id' do |id|
    TaskManager.database
    TaskManager.delete(id.to_i)
    redirect "/tasks"
  end

  not_found do
    erb :error
  end
end
