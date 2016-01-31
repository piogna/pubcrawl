helpers do

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_authenticated?
    session["user_id"] && User.find_by(id: session["user_id"])
  end

  def redirect_if_not_authenticated
    redirect '/sessions/login' unless user_authenticated?
  end

end

get '/' do
  @crawls = Crawl.all.order(:name)
  @user = User.new
  erb :index
end

get '/crawl/:id' do
  @crawl = Crawl.find_by(id: params[:id])
  @bars = Bar.where(crawl_id: params[:id]).order(crawl_position: :asc)
  erb :'crawl/show'
end

post '/crawl/new' do
  @crawl = Crawl.new(
    name: params[:name],
    description: params[:description],
    user_id: current_user.id
  )
  @crawl.save
  redirect "/crawl/#{@crawl.id}/add_bar"
end

get '/crawl/:id/add_bar' do
  @crawl = Crawl.find(params[:id])
  @bar = Bar.new
  erb :'crawl/new'
end

post '/crawl/:id/add_bar' do
  @crawl = Crawl.find(params[:id])
  @bar = Bar.new(
    name:     params[:name],
    address:  params[:address],
    city:     params[:city],
    url:      params[:url],
    crawl_id: @crawl.id
  )
  @bar.save
  if params[:add_bar]
    redirect "/crawl/#{@crawl.id}/add_bar"
  elsif params[:done]
    redirect "/crawl/#{@crawl.id}"
  end
end

get '/sessions/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/sessions/new' do
  @user = User.find_by(email: params[:email])
  erb :'sessions/new'
end

post '/sessions/new' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    session.delete(:user_id)
    redirect 'sessions/new'
  end
end

get '/sessions/register' do
  @user = User.new
  erb :'sessions/register'
end

post '/sessions/register' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
  if @user.save
    session["user_id"] ||= @user.id
    redirect '/'
  else
    erb :'sessions/register'
  end
end

get '/crawl/:crawl_id/bar/:id' do
  @bar = Bar.find(params[:id])
  @drink = Drink.new

  erb :'crawl/bar'
end

post '/crawl/:crawl_id/bar/:id/add_drink' do
  @bar = Bar.find(params[:id])
  @drink = Drink.new(
    name:         params[:name],
    category:     params[:category],
    bar_id:       @bar.id
  )
  @drink.save
  if params[:add_drink]
    redirect "/crawl/:crawl_id/bar/#{@bar.id}"
  elsif params[:done]
    redirect "/crawl/#{@bar.crawl_id}"
  end

end

get '/user/:id/crawls' do
  @user = current_user
  @crawls = Crawl.where(user_id: params[:id]).order(created_at: :asc)
  erb :'user/crawls'
end