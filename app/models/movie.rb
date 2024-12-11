class Movie < ApplicationRecord
    has_many :stars, dependent: :destroy # Relação com Star
    has_one_attached :image

    # Calcula a média das estrelas
    def average_stars
        return 0 if stars.empty?
        stars.average(:value).to_f # Calcula média usando ActiveRecord
    end

    def number_of_stars
        return 0 if stars.empty?
        stars.size.to_f
    end
end
