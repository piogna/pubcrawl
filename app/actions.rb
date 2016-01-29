require_relative('./helpers/view_helpers.rb')

# Homepage (Root path)
get '/' do
  @crawls = Crawl.all.order(:name)
  # binding.pry
  erb :index
end

get '/crawl/:id' do
  @crawl = Crawl.find_by(id: params[:id])
  @bars = Bar.where(crawl_id: params[:id]).order(crawl_position: :asc)
  #could also be done with @crawl.bars.each
  #using @bars to implement order_by crawl_position
  erb :'crawl/show'
end

post '/crawl/new' do
  @crawl = Crawl.new(
    name: params[:name],
    description: params[:description]
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
  puts "something something something"
  puts params.inspect
  @crawl = Crawl.find(params[:id])
  @bar = Bar.new(
    name:     params[:name],
    address:  params[:address],
    city:     params[:city],
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
  @user = User.new
  erb :'sessions/new'
end

post '/sessions/new' do
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session["user_id"] ||= user.id
    redirect '/'
  else
    redirect '/sessions/new'
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
    # get rid of username in the database
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
  if @user.save
    session["user_id"] ||= @user.id
    redirect '/'
  else
    redirect "/sessions/register"
  end
end

helpers do

  def current_user
    session["user_id"]
  end

  def user_authenticated?
    session["user_id"] && User.find_by(id: session["user_id"])
  end

  def redirect_if_not_authenticated
    redirect '/sessions/login' unless user_authenticated?
  end

end