class Build < ApplicationRecord
  has_paper_trail

  has_many :items, dependent: :nullify
end
