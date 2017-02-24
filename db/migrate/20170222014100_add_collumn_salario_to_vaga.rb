class AddCollumnSalarioToVaga < ActiveRecord::Migration[5.0]
  def change
    add_column :vagas, :salario, :float
  end
end
