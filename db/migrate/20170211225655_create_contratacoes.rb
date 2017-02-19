class CreateContratacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :contratacoes do |t|
      t.integer :status
      t.references :usuario, foreign_key: true
      t.references :vaga, foreign_key: true
      t.references :setor, foreign_key: true

      t.timestamps
    end
  end
end
