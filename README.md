# PubCrawl

### Lighthouse Labs - Week 4 project mid-term project

#### Coded by Hannah Jones, Ian Van Den Heuvel, and Paul Iogna

This is the MVP for our mid-term project.

It is built on the Sinatra framework and utilizes Google's Maps API for pub/bar placement and directions.

The basis for this app is to have a community of users generate pubcrawls to help others explore new/different areas of the city.

Users can create pubcrawls, listing the pubs they have visited and then add drinks had at each bar.

#### To run the app:

1. `bundle install`
2. Set up the database
  * rake db:create
  * rake db:migrate
  * rake db:seed
3. `shotgun -p 3000 -o 0.0.0.0`
4. Visit `http://localhost:3000/` in your browser
