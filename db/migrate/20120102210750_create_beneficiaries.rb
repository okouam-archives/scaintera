class CreateBeneficiaries < ActiveRecord::Migration
  def change
      create_table :beneficiaries do |t|
        t.enum :plan
        t.integer :policy_holder_id, :null => false
        t.string :names
        t.string :surname
        t.string :telephone
        t.datetime :dob
        t.timestamps
      end
  end
end
