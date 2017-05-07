class AddColumnsModalidadeObservacaoDuracaoFromTitulo < ActiveRecord::Migration[5.0]
  def change
    add_column :titulos, :modalidade, :integer, limit: 1
    add_column :titulos, :observacao, :text
    add_column :titulos, :duracao, :integer
  end
end
