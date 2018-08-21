class Instructor < ApplicationRecord
    has_many :cohorts
    validates :age, numericality: { age < 150 }
    validates :salary, numericality: { salary > 0 }
end
