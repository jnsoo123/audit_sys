class ItemForm 
  include ActiveModel::Model

  attr_accessor(
    :name,
    :date_purchased,
    :specs,
    :category_id
  )

  validates :name,           presence: true
  validates :date_purchased, presence: true

  def save
    return false if invalid?
    create_item
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Item')
  end

  private

  def create_item
    Item.create(
      name: name,
      date_purchased: date_purchased,
      specs: specs,
      category_id: category_id
    )
  end
end
