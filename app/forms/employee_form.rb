class EmployeeForm
  include ActiveModel::Model

  attr_accessor(
    :error,
    :employee,
    :name,
    :emp_id
  )

  validates :name,   presence: true
  validates :emp_id, presence: true

  validate :validate_data_integrity

  def initialize(attrs={})
    super
    set_attributes if self.employee.present?
    set_employee
  end

  def save
    return false if invalid?
    create_employee
  end

  def update
    return false if invalid?
    update_employee
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Employee')
  end

  private

  def set_attributes
    @name     ||= self.employee.name 
    @emp_id   ||= self.employee.emp_id 
  end

  def set_employee
    if self.employee.present?
      @employee        = Employee.find(self.employee.id)
      @employee.name   = @name
      @employee.emp_id = @emp_id
    else
      @employee = Employee.new(employee_params)
    end
  end

  def create_employee
    @employee.save
  end

  def update_employee
    @employee.save
  end

  def employee_params
    {
      name:   @name,
      emp_id: @emp_id
    }
  end

  def validate_data_integrity
    if @employee.invalid?
      promote_errors(@employee.errors)
    end
  end

  def promote_errors(model_errors)
    model_errors.each do |attribute, message|
      @errors.add(attribute, message)
    end 
  end
end
