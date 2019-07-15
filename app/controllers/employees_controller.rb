class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @q         = Employee.ransack(params[:q])
    @employees = @q.result
  end

  def new
    @employee_form = EmployeeForm.new
  end

  def create
    @employee_form = EmployeeForm.new(employee_params)

    if @employee_form.persist
      redirect_to employees_path, notice: 'Employee Created !!'
    else
      render :new
    end
  end

  def edit
    @employee_form = EmployeeForm.new(object: @employee)
  end

  def update
    hash_params    = employee_params.merge(object: @employee)
    @employee_form = EmployeeForm.new(hash_params)

    if @employee_form.persist
      redirect_to employees_path, notice: 'Employee Updated !!'
    else
      render :edit
    end
  end

  def destroy
    @employee_form = EmployeeForm.new(object: @employee)

    if @employee_form.destroy
      redirect_to employees_path, notice: 'Employee Deleted !!'
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :emp_id)
  end
end
