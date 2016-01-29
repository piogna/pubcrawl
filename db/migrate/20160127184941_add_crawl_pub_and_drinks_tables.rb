class AddCrawlPubAndDrinksTables < ActiveRecord::Migration
  def change
    create_table :crawls do |t|
      t.string        :name

      t.timestamps
    end

    create_table :bars do |t|
      t.references    :crawl
      t.string        :name
      t.string        :address
      t.string        :city
      t.string        :postal_code
      t.string        :longitude
      t.string        :latitude
      t.integer       :crawl_position

      t.timestamps
    end

    create_table :drinks do |t|
      t.references    :bar
      t.string        :name
      t.string        :category

      t.timestamps
    end

  end
end
