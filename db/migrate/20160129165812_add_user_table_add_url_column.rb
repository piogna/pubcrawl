class AddUserTableAddUrlColumn < ActiveRecord::Migration

    def change
      create_table :users do |t|
        t.string :first_name
        t.string :last_name
        t.string :username
        t.string :email
        t.string :password_digest

        t.timestamps
      end

      add_column :bars, :url, :string

      add_reference :crawls, :user, index: true
    end

end
