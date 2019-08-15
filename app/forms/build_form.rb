class BuildForm < FormObject
  validates :name, presence: true

  attr_accessor(
    :object,
    :name,
    :items,
  )

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Build')
  end

  private

  def klass
    Build
  end

  def set_attributes
    @name  ||= self.object.name
    @items ||= self.object.items
  end

  def object_params
    {
      name:  @name,
      items: set_items
    }
  end

  def set_items
    return []     if @items.nil?
    return @items if @items.first.is_a? Item

    @items.reject(&:blank?).map do |item_id|
      Item.find(item_id)
    end
  end
end
