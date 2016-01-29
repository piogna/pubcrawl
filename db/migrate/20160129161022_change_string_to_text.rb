class ChangeStringToText < ActiveRecord::Migration
  def change
    change_column :crawls, :description, :text
  end
end
