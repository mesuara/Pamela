class Cohort < ApplicationRecord
    has_many :students
    has_one :instructors
    belongs_to :courses
end
