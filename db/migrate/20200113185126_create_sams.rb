class CreateSams < ActiveRecord::Migration[6.0]
  def change
    create_table :sams do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
