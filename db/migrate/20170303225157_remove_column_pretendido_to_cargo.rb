class RemoveColumnPretendidoToCargo < ActiveRecord::Migration[5.0]
  def change
    remove_column :cargos, :pretendido
  end
end
