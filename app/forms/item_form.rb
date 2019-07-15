class ItemForm < FormObject
  attr_accessor(
    :object,
    :name,
    :date_purchased,
    :specs,
    :category_id,
    :build_id
  )

  validates :name,           presence: true
  validates :date_purchased, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Item')
  end

  private

  def klass
    Item
  end

  def set_attributes
    @name           ||= self.object.name
    @date_purchased ||= self.object.date_purchased
    @specs          ||= self.object.specs
    @category_id    ||= self.object.category_id
    @build_id       ||= self.object.build_id
  end

  def object_params
    {
      name:           @name,
      date_purchased: @date_purchased,
      specs:          @specs,
      category_id:    @category_id,
      build_id:       @build_id
    }
  end
end
