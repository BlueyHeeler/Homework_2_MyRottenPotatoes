class Movie < ApplicationRecord
    has_many :stars, dependent: :destroy # Relação com Star
    has_one_attached :image

    # Calcula a média das estrelas
    def average_stars
        return 0 if stars.empty?
        stars.average(:value).to_f # Calcula média usando ActiveRecord
    end
end
