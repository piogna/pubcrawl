# Homepage (Root path)
get '/' do
  @crawls = Crawl.all
  erb :index
end

get '/crawl/:id' do
  erb :'crawl/:id'
end


post '/crawl/new' do
  @crawl = Crawl.new(
    name: params[:name]
    )
  @crawl.save
  binding.pry
  redirect "/crawl/#{@crawl.id}/add_bar"
end

get '/crawl/:id/add_bar' do
  @crawl = Crawl.find(params[:id])
  @bar = Bar.new
  binding.pry
  erb :'crawl/new'
end

post '/crawl/:id/add_bar' do
  @crawl = Crawl.find(params[:id])
  @bar = Bar.new(
    name:     params[:name],
    address:  params[:address],
    city:     params[:city],
    crawl_id: @crawl.id
    )
  binding.pry
  @bar.save
  redirect "/crawl/#{@crawl.id}/add_bar"
end