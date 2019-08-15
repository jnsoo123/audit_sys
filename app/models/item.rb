class Item < ApplicationRecord
  belongs_to :category
  belongs_to :build, optional: true

  scope :buildless, -> { where(build_id: nil) }

  def qrcode
    "#{id}-#{name}-#{category.name}"
  end
end
