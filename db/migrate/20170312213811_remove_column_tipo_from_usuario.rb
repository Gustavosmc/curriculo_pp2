class RemoveColumnTipoFromUsuario < ActiveRecord::Migration[5.0]
  def change
    remove_column :usuarios, :tipo, :string
  end
end
