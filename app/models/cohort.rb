class Cohort < ApplicationRecord
    has_many :students, :dependent => :nullify
    belongs_to :instructor
    belongs_to :course
end
