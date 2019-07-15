class Employee < ApplicationRecord
  validates :emp_id, uniqueness: true
end
