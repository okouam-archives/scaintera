class CreateBeneficiaries < ActiveRecord::Migration
  def change
      create_table :beneficiaries do |t|
        t.integer :policy_id, :null => false
        t.string :relationship
        t.string :names
        t.string :surname
        t.string :telephone
        t.datetime :dob
        t.timestamps
      end
  end
end
