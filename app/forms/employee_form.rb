class EmployeeForm < FormObject
  attr_accessor(
    :object,
    :name,
    :emp_id
  )

  validates :name,   presence: true
  validates :emp_id, presence: true

  # If you're gonna have other business process, overwrite
  # this method
  # def persist
  #  return false if invalid?
  #  persist!
  #
  #  # Enter other business logic stuff
  # end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Employee')
  end

  def klass
    Employee
  end

  private

  def set_attributes
    @name     ||= self.object.name 
    @emp_id   ||= self.object.emp_id 
  end

  def object_params
    {
      name:   @name,
      emp_id: @emp_id
    }
  end
end
