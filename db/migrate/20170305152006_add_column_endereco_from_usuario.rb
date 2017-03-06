class AddColumnEnderecoFromUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :endereco, :string
  end
end
