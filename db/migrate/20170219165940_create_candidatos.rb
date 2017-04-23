class CreateCandidatos < ActiveRecord::Migration[5.0]
  def change
    create_table :candidatos do |t|
      t.references :vaga, foreign_key: true
      t.references :usuario, foreign_key: true
      t.boolean :contratado
      t.text :observacao
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
