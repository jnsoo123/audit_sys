class Employee < ApplicationRecord
  has_paper_trail

  validates :emp_id, uniqueness: true
end
