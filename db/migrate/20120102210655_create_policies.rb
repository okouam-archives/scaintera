class CreatePolicies < ActiveRecord::Migration
  def change
      create_table :policies do |t|
        t.enum :category
        t.enum :status
        t.integer :user_id, :null => false
        t.integer :policy_holder_id, :null => false
        t.string :payment_type
        t.timestamps
      end
  end
end
