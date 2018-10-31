class EmployeesController < ApplicationController
<<<<<<< HEAD

  def index
    @employees = User.all
  end

  def show
  end

  def new
    @employee = User.new
  end

  def edit
  end

  def create
    @employee = User.new(employee_params)
=======
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
>>>>>>> third

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  def update
    respond_to do |format|
      if @employee.update(invite_params)
=======
  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
>>>>>>> third
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employee_url, notice: 'Employee was successfully destroyed.' }
=======
  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
>>>>>>> third
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
<<<<<<< HEAD
    def set_invite
      @employee = User.find(params[:id])
=======
    def set_employee
      @employee = Employee.find(params[:id])
>>>>>>> third
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
<<<<<<< HEAD
      params.require(:invite).permit(:full_name, :email, :phone_number, :assistant_email)
    end
end
=======
      params.require(:employee).permit(:full_name, :email, :phone_number, :assistant_email, :delete_at, :location_id)
    end
end
>>>>>>> third
