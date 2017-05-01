class AddCollumnParenteAssociadoFromCurriculo < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculos, :parente_associado, :boolean, default: false
    add_column :curriculos, :parentesco, :integer, limit: 1

  end
end
