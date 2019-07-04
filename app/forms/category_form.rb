class CategoryForm
  include ActiveModel::Model

  attr_accessor(
    :name,
    :color
  )

  validates :name,  presence: true
  validates :color, presence: true

  def save
    return false if invalid?
    create_category
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Category')
  end

  private

  def create_category
    Category.create(
      name: name,
      color: color
    )
  end
end
