class AddColumnEntidadeFromCargo < ActiveRecord::Migration[5.0]
  def change
    add_column :cargos, :entidade, :string
  end
end
