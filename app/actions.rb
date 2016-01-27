# Homepage (Root path)
get '/' do
  @crawls = Crawl.all
  erb :index
end

get '/crawl/:id' do

end
