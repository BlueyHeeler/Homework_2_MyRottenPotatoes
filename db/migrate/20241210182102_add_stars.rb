class AddStars < ActiveRecord::Migration[7.2]
  def change
    create_table :stars do |t|
      t.float :value, null: false # A nota atribuída
      t.references :movie, null: false, foreign_key: true # Associa Star a Movie
      t.timestamps
    end
  end
end
