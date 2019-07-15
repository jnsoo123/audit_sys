class BuildForm < FormObject
  validates :name, presence: true

  attr_accessor(
    :object,
    :name,
  )

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Build')
  end

  private

  def klass
    Build
  end

  def set_attributes
    @name ||= self.object.name
  end

  def object_params
    {
      name: @name
    }
  end
end
