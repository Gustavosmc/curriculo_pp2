class CreateCargoPretendidos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargo_pretendidos do |t|
      t.string :descricao
      t.integer :anos_exp
      t.integer :meses_exp
      t.integer :dias_exp
      t.float :pretensao_sal
      t.references :curriculo, foreign_key: true
      t.text :observacao

      t.timestamps
    end
  end
end
