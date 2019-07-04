class ItemForm 
  include ActiveModel::Model

  attr_accessor(
    :item,
    :name,
    :date_purchased,
    :specs,
    :category_id
  )

  validates :name,           presence: true
  validates :date_purchased, presence: true

  def initialize(attr={})
    super
    set_attributes if @item.present?
  end

  def save
    return false if invalid?
    create_item
  end

  def update
    return false if invalid?
    update_item
  end
  
  def destroy
    return false if invalid?
    destroy_item
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Item')
  end

  private

  def set_attributes
    @name           ||= @item.name
    @date_purchased ||= @item.date_purchased
    @specs          ||= @item.specs
    @category_id    ||= @item.category_id
  end

  def create_item
    Item.create(item_params)
  end

  def update_item
    @item.update(item_params)
  end

  def destroy_item
    @item.destroy
  end

  def item_params
    {
      name: name,
      date_purchased: date_purchased,
      specs: specs,
      category_id: category_id
    }
  end
end
