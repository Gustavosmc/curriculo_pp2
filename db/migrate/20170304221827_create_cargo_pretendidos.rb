class CreateCargoPretendidos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargo_pretendidos do |t|
      t.string :descricao, limit: 80
      t.integer :anos_exp, limit: 2
      t.integer :meses_exp, limit: 2
      t.integer :dias_exp, limit: 2
      t.float :pretensao_sal
      t.references :curriculo, foreign_key: true
      t.text :observacao

      t.timestamps
    end
  end
end
