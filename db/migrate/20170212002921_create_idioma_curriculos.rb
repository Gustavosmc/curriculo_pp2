class CreateIdiomaCurriculos < ActiveRecord::Migration[5.0]
  def change
    create_table :idioma_curriculos do |t|
      t.integer :le
      t.integer :fala
      t.integer :escreve
      t.integer :status
      t.references :curriculo, foreign_key: true
      t.references :idioma, foreign_key: true

      t.timestamps
    end
  end
end
