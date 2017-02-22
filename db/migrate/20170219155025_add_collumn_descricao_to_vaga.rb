class AddCollumnDescricaoToVaga < ActiveRecord::Migration[5.0]
  def change
    add_column :vagas, :descricao, :string
  end
end
