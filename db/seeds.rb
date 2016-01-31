require 'faker'

tag_1 = Tag.create(
  name: "beer"
)

tag_2 = Tag.create(
  name: "cocktails"
)

tag_3 = Tag.create(
  name: "wine"
)

tag_4 = Tag.create(
  name: "pubs"
)

tag_5 = Tag.create(
  name: "clubs"
)

tag_6 = Tag.create(
  name: "lounges"
)

crawl_1 = Crawl.new(
  name: "Cool Crawl",
  description: "Coolest crawl evah"
)

crawl_1.tags << tag_1

crawl_1.tags << tag_2

crawl_1.tags << tag_3

crawl_1.save

crawl_2 = Crawl.create!(
  name: "Sick Crawl",
  description: "drink till you spew!"
)

bar_1 = Bar.create!(
  name: "Sneaky Dee's",
  address: "431 College Street",
  city: "Toronto",
  postal_code: "M5T 1T1",
  crawl_position: 1,
  crawl: crawl_1
)

bar_2 = Bar.create!(
  name: "Wvrst",
  address: "609 King St W",
  city: "Toronto",
  postal_code: "M5V 1M5",
  crawl_position: 1,
  crawl: crawl_2
)

bar_3 = Bar.create!(
  name: "Bar Hop",
  address: "391 King St W",
  city: "Toronto",
  postal_code: "M5V 1K1",
  crawl_position: 2,
  crawl: crawl_2
)

bar_4 = Bar.create!(
  name: "Horseshoe Tavern",
  address: "370 Queen St W",
  city: "Toronto",
  postal_code: "M5V 2A2",
  crawl_position: 3,
  crawl: crawl_2
)

bar_5 = Bar.create!(
  name: "Mr. Flamingo",
  address: "1265 Dundas St W",
  city: "Toronto",
  postal_code: "M6J 1X6",
  crawl_position: 2,
  crawl: crawl_1
)

bar_6 = Bar.create!(
  name: "Wallflower",
  address: "1665 Dundas St W",
  city: "Toronto",
  postal_code: "M6K 1V2",
  crawl_position: 3,
  crawl: crawl_1
)
