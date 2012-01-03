class CreatePolicies < ActiveRecord::Migration
  def change
      create_table :policies do |t|
        t.string :policy_number, :null => false
        t.string :category, :null => false
        t.string :status, :null => false
        t.integer :user_id, :null => false
        t.integer :policy_holder_id, :null => false
        t.timestamps
      end
  end
end
