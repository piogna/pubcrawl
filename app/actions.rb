# Homepage (Root path)
get '/' do
  @crawls = Crawl.all
  erb :index
end

# get '/crawl/:id' do
#   erb :'crawl/:id'
# end

get '/crawl/new' do
  erb :'crawl/new'
end

post '/crawl/new' do
  @crawl = Crawl.new
  @bar1 = Bar.new
  @bar2 = Bar.new
  @bar3 = Bar.new
end