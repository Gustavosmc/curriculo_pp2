class AddColumnEnderecoToCurriculo < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculos, :endereco_comp, :string
  end
end
