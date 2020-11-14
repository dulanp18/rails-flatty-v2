class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :flat_name
      t.string :street_address, null: false
      t.string :suburb, null: false
      t.string :city, null: false
      t.integer :post_code, null: false
      t.string :country, null: false
      t.integer :max_tenants_nums, null: false
      t.integer :current_tenants_num
      t.date :lease_start_date, null: false
      t.integer :length_of_lease, null: false

      t.timestamps
    end
  end
end
