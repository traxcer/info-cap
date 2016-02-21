class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :tipo
      t.date :comienzo
      t.date :final
      t.string :turno
      t.string :lugar
      t.date :cierre

      t.timestamps null: false
    end
  end
end
