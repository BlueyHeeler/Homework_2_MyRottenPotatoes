class CreateMovies < ActiveRecord::Migration[6.1] # Ajuste a versão para a sua configuração
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date
      # Adiciona campos automáticos para timestamps (created_at e updated_at)
      t.timestamps
    end
  end
end
