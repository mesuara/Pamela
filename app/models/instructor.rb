class Instructor < ApplicationRecord
    has_many :cohorts
    validates :age, numericality: { less_than: 150 }
    validates :salary, numericality: { more_than: 0 }
end
