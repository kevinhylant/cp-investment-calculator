class EstimatesController < ApplicationController
    before_action :objects_for_view, only: [:show, :create, :update]
   # autocomplete :rent, :cost
    # respond_to :html, :js

  def show    
    if Estimate.last
      @estimate = Estimate.last
      @operating_cost = @estimate.operating_cost
      @operating_cost = @estimate.fixed_cost
    end
  end

  def create
    @studio = Studio.create(studio_params)
    @employee = @studio.employees.create(employee_params)
    fixed_params = MyGenerator.convert_param_vals_to_i(fixed_cost_params)
    @fixed_cost = @employee.fixed_costs.create(fixed_params)
    @fixed_cost.employee_id = @employee.id
    @activity_type = ActivityType.create(activity_type_params)

    @activity_types = Estimate.purge_unwanted_attributes(@activity_type).values
    @fc_sum = @fixed_cost.calculate_sum
    estimate_params = Estimate.generate_params_from([@studio,@employee,@fixed_cost,@activity_type])
    @estimate = @fixed_cost.create_estimate(estimate_params)
    render :show
  end


  def update
    @estimate = Estimate.find(params['estimate_id'])
    fixed_params = MyGenerator.convert_param_vals_to_i(params[:operating_costs])
    @operating_cost = OperatingCost.create(fixed_params)
    @estimate.operating_cost_id = @operating_cost.id
    @estimate.save
    @oc_sum = @operating_cost.calculate_sum
    estimate_params = Estimate.generate_params_from([@operating_cost])
    @estimate.update(estimate_params)

    render :show
  end


  def admin
    @estimates = Estimate.all
    render :admin
  end


  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def fixed_cost_params
      params.require(:fixed_costs).permit(:rent,:security_deposit,:construction_cost,:training_equipment_cost,:av_equipment_cost,:architect_cost)
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

    def objects_for_view  
      @activities = MyGenerator.activities
      @cities     = MyGenerator.cities
      @operating_costs = MyGenerator.operating_costs
      @fixed_costs = MyGenerator.fixed_costs
    end
end



