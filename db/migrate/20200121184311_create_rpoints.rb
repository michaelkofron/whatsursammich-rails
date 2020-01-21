class CreateRpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :rpoints do |t|
      t.integer :review_id
      t.integer :user_id
      t.integer :value
    end
  end
end
