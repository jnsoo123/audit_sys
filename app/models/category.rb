class Category < ApplicationRecord
  has_paper_trail

  has_many :items
end
