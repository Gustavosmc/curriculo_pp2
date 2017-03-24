class RemoveColumnNomeFromAdminUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :admin_useres, :nome, :string
  end
end
