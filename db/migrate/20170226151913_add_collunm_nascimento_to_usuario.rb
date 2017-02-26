class AddCollunmNascimentoToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :nascimento, :date
  end
end
