class Student < ApplicationRecord
    belongs_to :cohort
    belongs_to :user
    validates :age, numericality: { less_than: 150 };
end
