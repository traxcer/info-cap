class AddUserIdToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :user_id, :integer
    add_index :cursos, :user_id
  end
end
