class Item < ApplicationRecord
  belongs_to :category
  belongs_to :build, optional: true

  def qrcode
    "#{id}-#{name}-#{category.name}"
  end
end
