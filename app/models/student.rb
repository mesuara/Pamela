class Student < ApplicationRecord
    belongs_to :cohorts
    validates :age, numericality: { less_than: 150 };
end
