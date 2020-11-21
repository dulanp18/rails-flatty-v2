class AddFieldToTenant < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :active_tenant, :boolean, default: true
  end
end
