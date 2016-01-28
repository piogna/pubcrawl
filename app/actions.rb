# Homepage (Root path)
get '/' do
  @crawls = Crawl.all
  erb :index
end

# get '/crawl/:id' do
#   erb :'crawl/:id'
# end

# get '/crawl/new' do
#   @bar = Bar.new
#   erb :'crawl/new'
# end

post '/crawl/new' do
  @crawl = Crawl.new(
    name: params[:name]
    )
  @crawl.save
  redirect "/crawl/#{@crawl.id}/add_bar"
end

get '/crawl/:id/add_bar' do
  @crawl = Crawl.find_by params[:id]

  @bar = Bar.new
  erb :'crawl/new'
end