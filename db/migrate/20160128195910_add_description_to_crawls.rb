class AddDescriptionToCrawls < ActiveRecord::Migration
  def change
    add_column :crawls, :description, :string
  end
end
