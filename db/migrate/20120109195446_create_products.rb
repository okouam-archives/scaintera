class CreateProducts < ActiveRecord::Migration
  def change
      create_table :products do |t|
        t.string :cover, :null => false
        t.datetime :expiry_date
        t.decimal :premium_amount
        t.integer :policy_holder_id, :null => false
        t.timestamps
      end
  end
end
