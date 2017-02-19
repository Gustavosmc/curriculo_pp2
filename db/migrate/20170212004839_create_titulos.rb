class CreateTitulos < ActiveRecord::Migration[5.0]
  def change
    create_table :titulos do |t|
      t.string :descricao
      t.string :entidade
      t.integer :ano
      t.integer :desenvolvimento
      t.integer :grau
      t.integer :status
      t.references :curriculo, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
