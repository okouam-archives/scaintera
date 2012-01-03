class CreateAddresses < ActiveRecord::Migration
  def change
      create_table :addresses do |t|
        t.integer :addressable_id
        t.string :addressable_type
        t.string :postcode
        t.string :postal_town
        t.string :address_line_1
        t.string :address_line_2
        t.string :county
        t.string :country
      end
  end
end
