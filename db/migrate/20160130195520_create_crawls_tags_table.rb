class CreateCrawlsTagsTable < ActiveRecord::Migration
  def change
    create_table :crawls_tags do |t|
      t.belongs_to :crawl, index: true
      t.belongs_to :tag, index: true
    end
  end
end
