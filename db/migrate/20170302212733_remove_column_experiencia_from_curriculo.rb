class RemoveColumnExperienciaFromCurriculo < ActiveRecord::Migration[5.0]
  def change
    remove_column :curriculos, :experiencia
  end
end
