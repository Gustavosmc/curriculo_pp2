class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.text :resumo
      t.string :nome
      t.string :cpf
      t.date :datanascimento
      t.integer :sexo
      t.integer :estadocivil
      t.string :telefone
      t.string :naturalidade
      t.integer :tipo
      t.integer :status

      t.timestamps
    end
  end
end
