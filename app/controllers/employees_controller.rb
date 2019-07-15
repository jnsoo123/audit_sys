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
    if @employee_form.save
      redirect_to employees_path, notice: 'Employee Created !!'
    else
      render :new
    end
  end

  def edit
    @employee_form = EmployeeForm.new(employee: @employee)
  end

  def update
    @employee_form = EmployeeForm.new(employee_params.merge(employee: @employee))
    if @employee_form.update
      redirect_to employees_path, notice: 'Employee Updated !!'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :emp_id)
  end
end
