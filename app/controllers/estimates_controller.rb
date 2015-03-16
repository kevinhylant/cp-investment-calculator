class EstimatesController < ApplicationController
    before_action :objects_for_view, only: [:new, :create, :update]
    before_action :get_attributes_from_employee_or_set_sessions, only: [:new, :create, :update]

  def new
    get_past_form_info    
  
  end

  def create
    create_fc_from_params
    @fc_sum = @fixed_cost.calculate_sum
    estimate_params = Estimate.generate_params_from([@studio,@employee,@fixed_cost,@activity_type])
    if session[:estimate_id]
      @estimate = Estimate.find(session[:estimate_id])
      @estimate.fixed_cost_id = @fixed_cost.id 
      @estimate.update(estimate_params)
    else
      binding.pry
      @estimate = @fixed_cost.create_estimate(estimate_params)
      session[:estimate_id] = @estimate.id
      binding.pry
    end

    @operating_cost = @estimate.operating_cost if @estimate.operating_cost
    respond_to do |format|
      format.html { render :action => "new" }
      format.js
    end
  end


  def update
    create_oc_from_params

    @oc_sum = @operating_cost.calculate_sum
    estimate_params = Estimate.generate_params_from([@operating_cost])

    if session[:estimate_id]
      @estimate = Estimate.find(session[:estimate_id])
      binding.pry
      @estimate.operating_cost_id = @operating_cost.id 
      @estimate.update(estimate_params)
    else
      @estimate = @operating_cost.create_estimate(estimate_params)
      session[:estimate_id] = @estimate.id
    end
    binding.pry
    
    @fixed_cost = @estimate.fixed_cost if @estimate.fixed_cost
    
    respond_to do |format|
      format.html { render :action => "new" }
      format.js
    end
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
      @oc_categories = ['Instructors',"",'Front Desk',"",'Salaried Staff']
    end



    def get_attributes_from_employee_or_set_sessions
      if session[:employee_id]
        @employee = Employee.find(session[:employee_id])
        @studio = @employee.studio
        @activity_type = @studio.activity_type
        @activity_types = Estimate.purge_unwanted_attributes(@activity_type).values
      elsif params[:fixed_costs]
        @studio = Studio.create(studio_params)
        @employee = @studio.employees.create(employee_params)
        @activity_type = @studio.create_activity_type(activity_type_params)
        @activity_types = Estimate.purge_unwanted_attributes(@activity_type).values
        session[:employee_id] = @employee.id
      end
    end

    def get_past_form_info
      if session[:employee_id]
        get_attributes_from_employee_or_set_sessions
        @fixed_cost = @employee.fixed_costs.last if @employee.fixed_costs
        @operating_cost = @employee.operating_costs.last if @employee.operating_costs
        @estimate = @fixed_cost.estimate
        @fc_sum = @fixed_cost.calculate_sum if @fixed_cost
        @oc_sum = @operating_cost.calculate_sum if @operating_cost
      end
    end

    def create_fc_from_params
      fixed_params = MyGenerator.convert_param_vals_to_i(fixed_cost_params)
      @fixed_cost = @employee.fixed_costs.create(fixed_params)
      @fixed_cost.employee_id = @employee.id
    end

    def create_oc_from_params
      fixed_params = MyGenerator.convert_param_vals_to_i(params[:operating_costs])
      @operating_cost = OperatingCost.create(fixed_params)
      @operating_cost.employee_id  = @employee.id if @employee
    end
end



