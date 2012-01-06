class CreatePolicyHolders < ActiveRecord::Migration
  def change
      create_table :policy_holders do |t|
        t.string :first_name
        t.string :middle_names
        t.string :last_name
        t.string :title
        t.string :employer
        t.integer :user_id
        t.string :dob
        t.timestamps
      end
  end
end
