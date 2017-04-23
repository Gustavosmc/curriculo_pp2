class CreateIdiomaCurriculos < ActiveRecord::Migration[5.0]
  def change
    create_table :idioma_curriculos do |t|
      t.integer :le, limit: 1
      t.integer :fala, limit: 1
      t.integer :escreve, limit: 1
      t.integer :status, limit: 1
      t.references :curriculo, foreign_key: true
      t.references :idioma, foreign_key: true

      t.timestamps
    end
  end
end
