# Homepage (Root path)
get '/' do
  @crawls = Crawl.all
  erb :index
end

get '/crawl/new' do
  erb :'crawl/new'
end

get '/crawl/:id' do
  @crawl = Crawl.find_by(id: params[:id])
  @bars = Bar.where(crawl_id: params[:id]).order(crawl_position: :asc)
  #could also be done with @crawl.bars.each
  #using @bars to implement order_by crawl_position
  erb :'crawl/show'
end

post '/crawl/new' do
  @crawl = Crawl.new
  @bar1 = Bar.new
  @bar2 = Bar.new
  @bar3 = Bar.new
end