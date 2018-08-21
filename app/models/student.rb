class Student < ApplicationRecord
    belongs_to :cohorts
    validates :age, numericality: { age < 150 }
end
