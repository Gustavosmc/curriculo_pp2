class ChangeColumnUltimoSalFromCargos < ActiveRecord::Migration[5.0]
  def change
    change_column :cargos, :ultimo_sal, :decimal, :precision => 8, :scale => 2
    change_column :cargo_pretendidos, :pretensao_sal, :decimal, :precision => 8, :scale => 2
  end
end
