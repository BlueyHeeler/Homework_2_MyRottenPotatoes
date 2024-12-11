class Star < ApplicationRecord
    belongs_to :movie
    validates :value, presence: true, inclusion: { in: 0..5 } # Garantir valor entre 0 e 5
end
