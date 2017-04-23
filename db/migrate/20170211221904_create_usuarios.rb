class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.text :resumo
      t.string :nome, limit: 160
      t.string :cpf, limit: 15
      t.date :datanascimento
      t.integer :sexo, limit: 1
      t.integer :estadocivil, limit: 1
      t.string :telefone, limit: 15
      t.string :naturalidade
      t.integer :tipo, limit: 1
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
