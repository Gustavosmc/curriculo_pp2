class CreateCurriculos < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculos do |t|
      t.text :observacao
      t.integer :experiencia, limit: 1
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
