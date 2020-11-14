class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :tenant_agreement_type, null: false
      t.boolean :head_tenant

      t.timestamps
    end
  end
end
