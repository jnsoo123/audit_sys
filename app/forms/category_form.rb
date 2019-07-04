class CategoryForm
  include ActiveModel::Model

  attr_accessor(
    :category,
    :name,
    :color
  )

  validates :name,  presence: true
  validates :color, presence: true

  def initialize(attr={})
    super
    set_attributes if self.category.present?
  end

  def save
    return false if invalid?
    create_category
  end

  def update
    return false if invalid?
    update_category
  end

  def destroy
    return false if invalid?
    destroy_category
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Category')
  end

  private

  def set_attributes
    @name  ||= self.category.name
    @color ||= self.category.color
  end

  def create_category
    Category.create(category_params)
  end

  def update_category
    @category.update(category_params)
  end

  def destroy_category
    @category.destroy
  end

  def category_params
    {
      name:  @name,
      color: @color
    }
  end
end
