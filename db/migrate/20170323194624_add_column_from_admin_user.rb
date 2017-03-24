class AddColumnFromAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_useres, :nome, :string
  end
end
