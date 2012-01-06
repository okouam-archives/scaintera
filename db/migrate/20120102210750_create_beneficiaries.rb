class CreateBeneficiaries < ActiveRecord::Migration
  def change
      create_table :beneficiaries do |t|
        t.integer :policy_id, :null => false
        t.string :relationship
        t.string :title
        t.string :first_name
        t.string :middle_names
        t.string :last_name
        t.string :title
        t.string :employer
        t.string :dob
        t.timestamps
      end
  end
end
