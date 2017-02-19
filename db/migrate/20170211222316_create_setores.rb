class CreateSetores < ActiveRecord::Migration[5.0]
  def change
    create_table :setores do |t|
      t.string :descricao
      t.integer :status

      t.timestamps
    end
  end
end
