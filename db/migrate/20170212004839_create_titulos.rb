class CreateTitulos < ActiveRecord::Migration[5.0]
  def change
    create_table :titulos do |t|
      t.string :descricao, limit: 80
      t.string :entidade, limit: 80
      t.integer :ano, limit: 2
      t.integer :desenvolvimento, limit: 1
      t.integer :grau, limit: 1
      t.integer :status, limit: 1
      t.references :curriculo, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
