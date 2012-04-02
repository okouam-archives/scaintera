class CreatePrices < ActiveRecord::Migration
  def change
      create_table :prices do |t|
        t.string :plan
        t.decimal :joining_fee
        t.decimal :premium
      end
  end
end
