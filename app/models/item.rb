class Item < ApplicationRecord
  has_paper_trail

  belongs_to :category
  belongs_to :build, optional: true

  scope :buildless, -> { where(build_id: nil) }

  def qrcode
    "#{id}-#{name}-#{category.name}"
  end
end
