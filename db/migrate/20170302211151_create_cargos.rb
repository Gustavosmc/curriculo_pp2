class CreateCargos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargos do |t|
      t.string :descricao
      t.integer :experiencia
      t.boolean :pretendido
      t.date :inicio
      t.integer :desenvolvimento
      t.date :fim
      t.float :ultimo_sal
      t.float :pretencao_sal
      t.text :detalhes
      t.references :curriculo, foreign_key: true

      t.timestamps
    end
  end
end
