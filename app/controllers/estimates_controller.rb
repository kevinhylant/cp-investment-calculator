class EstimatesController < ApplicationController
   # autocomplete :rent, :cost
    # respond_to :html, :js

  def show    
    @studios    = Studio.all
    @activities = MyGenerator.activities
    @cities     = MyGenerator.cities
    @operating_costs = MyGenerator.operating_costs
    @fixed_costs = MyGenerator.fixed_costs
  end

  def create
    @estimate = Estimate.create
    if params[:fixed_costs]
      @studio = Studio.create(studio_params)
      @employee = @studio.employees.create(employee_params)
      fixed_params = MyGenerator.convert_param_vals_to_i(fixed_cost_params)
      @fixed_cost = @employee.fixed_costs.create(fixed_params)
      @fixed_cost_sum = @fixed_cost.calculate_sum
      activity_type = ActivityType.create(activity_type_params)
      @activity_types = activity_type.attributes.keys[1..-4]
    elsif params[:operating_costs]
      fixed_params = MyGenerator.convert_param_vals_to_i(params[:operating_costs])
      @operating_cost = OperatingCost.create(fixed_params)
      @operating_cost_sum = @operating_cost.calculate_sum
    end
    
    @studios    = Studio.all
    @activities = MyGenerator.activities
    @cities     = MyGenerator.cities
    @operating_costs = MyGenerator.operating_costs
    @fixed_costs = MyGenerator.fixed_costs
    
    render 'show'
  end

  def admin
    @employees = Employee.all
    render :admin
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def fixed_cost_params
      params.require(:fixed_costs).permit(:rent,:security_deposit,:build_out_cost,:training_equipment_cost,:av_equipment_cost,:architect_cost)
    end 
    def operating_cost_params
      params.require(:operating_costs).permit(:avg_instructor_per_class_pay,:avg_monthly_classes,:front_desk_hourly_pay,:avg_monthly_front_desk_hours,:laundry_service_monthly_cost,:cleaning_service_monthly_cost,:accountant_and_payroll_monthly_pay,:employee_monthly_salary,:salaried_employees_count,:other_operating_costs)
    end 
    def studio_params
      params.require(:studio).permit(:name,:hq_city)
    end 
    def employee_params
      params.require(:employee).permit(:name,:position)
    end 
    def activity_type_params
      params.require(:activity_types).permit(:spin,:strength_training,:barre,:yoga,:dance,:pilates,:other)
    end
end



