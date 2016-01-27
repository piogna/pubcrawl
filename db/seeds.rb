require 'faker'

crawl_1 = Crawl.create!(
  name: "Cool Crawl"
)

crawl_2 = Crawl.create!(
  name: "Sick Crawl"
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
