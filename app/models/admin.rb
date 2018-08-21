class Admin < ApplicationRecord
    has_many :students
    has_many :instructors
    has_many :cohorts
    has_many :courses
end
