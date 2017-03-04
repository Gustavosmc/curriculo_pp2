class RemoveColumnExperienciaPretensaoToCargo < ActiveRecord::Migration[5.0]
  def change
    remove_column :cargos, :experiencia
    remove_column :cargos, :pretencao_sal
  end
end
