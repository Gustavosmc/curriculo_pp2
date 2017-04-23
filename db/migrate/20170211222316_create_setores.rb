class CreateSetores < ActiveRecord::Migration[5.0]
  def change
    create_table :setores do |t|
      t.string :descricao, limit: 80
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
