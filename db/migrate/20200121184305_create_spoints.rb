class CreateSpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :spoints do |t|
      t.integer :sam_id
      t.integer :user_id
      t.integer :value
    end
  end
end
