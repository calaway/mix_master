class CreateArtist < ActiveRecord::Migration
  def change
    create_table :artists do |table|
      table.string :name
      table.string :image_path

      table.timestamps null: false
    end
  end
end
