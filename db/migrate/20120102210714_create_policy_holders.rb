class CreatePolicyHolders < ActiveRecord::Migration
  def change
      create_table :policy_holders do |t|
        t.integer :policy_id
        t.string :first_name
        t.string :middle_names
        t.string :last_name
        t.string :title
        t.string :employer
        t.string :dob
      end
  end
end
