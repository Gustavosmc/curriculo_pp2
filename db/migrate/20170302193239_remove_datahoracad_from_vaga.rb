class RemoveDatahoracadFromVaga < ActiveRecord::Migration[5.0]
  def change
    remove_column :vagas, :datahorac
  end
end
