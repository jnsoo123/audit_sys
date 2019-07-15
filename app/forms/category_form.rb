class CategoryForm < FormObject
  attr_accessor(
    :object,
    :name,
    :color
  )

  validates :name,  presence: true
  validates :color, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Category')
  end

  private

  def klass
    Category
  end

  def set_attributes
    @name  ||= self.object.name
    @color ||= self.object.color
  end

  def object_params
    {
      name:  @name,
      color: @color
    }
  end
end
