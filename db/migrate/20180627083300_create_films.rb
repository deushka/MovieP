class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.float :rating

      t.timestamps
    end
  end
end
