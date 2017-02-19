class CreateVagas < ActiveRecord::Migration[5.0]
  def change
    create_table :vagas do |t|
      t.datetime :datahorac
      t.text :requisitos
      t.integer :especial
      t.integer :status
      t.references :setor, foreign_key: true

      t.timestamps
    end
  end
end
