require 'net/http'
require 'json'
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
  @crawl = Crawl.find(params[:id])
  @bar = Bar.new(
    name:     params[:name],
    address:  params[:address],
    city:     params[:city],
    crawl_id: @crawl.id
  )
  uri_string = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@bar.address},#{@bar.city}&key=AIzaSyBX6s8EgaN-Pv8axPpoZvHYY4xL4fRHnck"
  uri_string.gsub!(" ", "+")
  uri = URI(uri_string)
  response = Net::HTTP.get uri
  location = JSON.parse response
  @bar.latitude = location["results"][0]["geometry"]["location"]["lat"].to_s
  @bar.longitude = location["results"][0]["geometry"]["location"]["lng"].to_s
  @bar.save
  redirect "/crawl/#{@crawl.id}/add_bar"
end

get '/crawl/done/:id' do
  @crawl = Crawl.find(params[:id])
  @bars = Bar.where(crawl_id: params[:id]).order(crawl_position: :asc)
  @bar = Bar.new(
    name:     params[:name],
    address:  params[:address],
    city:     params[:city],
    crawl_id: @crawl.id
    )
  uri_string = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@bar.address},#{@bar.city}&key=AIzaSyBX6s8EgaN-Pv8axPpoZvHYY4xL4fRHnck"
  uri_string.gsub!(" ", "+")
  uri = URI(uri_string)
  response = Net::HTTP.get uri
  location = JSON.parse response
  @bar.latitude = location["results"][0]["geometry"]["location"]["lat"].to_s
  @bar.longitude = location["results"][0]["geometry"]["location"]["lng"].to_s
  @bar.save
  erb :'crawl/show'
end

# post '/crawl/done/:id' do
#   @crawl = Crawl.find(params[:id])
#   @bar = Bar.new(
#     name:     params[:name],
#     address:  params[:address],
#     city:     params[:city],
#     crawl_id: @crawl.id
#   )
#   uri_string = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@bar.address},#{@bar.city}&key=AIzaSyBX6s8EgaN-Pv8axPpoZvHYY4xL4fRHnck"
#   uri_string.gsub!(" ", "+")
#   uri = URI(uri_string)
#   response = Net::HTTP.get uri
#   location = JSON.parse response
#   @bar.latitude = location["results"][0]["geometry"]["location"]["lat"].to_s
#   @bar.longitude = location["results"][0]["geometry"]["location"]["lng"].to_s
#   @bar.save
#   redirect "/crawl/#{@crawl.id}"
# end


