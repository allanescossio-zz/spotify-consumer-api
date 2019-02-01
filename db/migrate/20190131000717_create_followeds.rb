class CreateFolloweds < ActiveRecord::Migration[5.2]
  def change
    create_table :followeds do |t|
      t.string :name, null: false
      t.string :external_url, null: false
      t.string :genres, null: false
      t.string :image_url
      t.integer :total_followers

      t.timestamps
    end
  end
end
