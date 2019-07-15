class BuildForm
  include ActiveModel::Model

  validates :name, presence: true

  attr_accessor(
    :build,
    :name,
  )

  def initialize(attrs={})
    super
    set_attributes if self.build.present?
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Build')
  end

  def save
    return false if invalid?
    create_build
  end

  def update
    return false if invalid?
    update_build
  end

  def destroy
    return false if invalid?
    destroy_build
  end

  private

  def create_build
    Build.create(build_params)
  end

  def update_build
    @build.update(build_params)
  end

  def destroy_build
    @build.destroy
  end

  def build_params
    {
      name: @name
    }
  end

  def set_attributes
    @name ||= self.build.name
  end
end
