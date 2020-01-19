class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :rating
      t.integer :user_id
      t.integer :sam_id
    end
  end
end
