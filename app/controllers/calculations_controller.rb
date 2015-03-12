class CalculationsController < ApplicationController
   # autocomplete :rent, :cost

  def new    
    @studios    = Studio.all
    @activities = MyGenerator.activities
    @cities     = MyGenerator.cities
    @operating_costs = MyGenerator.operating_costs
    @fixed_costs = MyGenerator.fixed_costs

  end

  def create
    fixed_params = MyGenerator.convert_param_vals_to_i(params[:fixed_costs])
    fixed_costs = FixedCost.create(fixed_params)
    @sum = fixed_costs.calculate_sum
      # assign calculation to sessions
    @studios    = Studio.all
    @activities = MyGenerator.activities
    @cities     = MyGenerator.cities
    @operating_costs = MyGenerator.operating_costs
    @fixed_costs = MyGenerator.fixed_costs
    
    render :new
  end

  # def show
  # end

  # def index
  # end

  # def update
  # end

end
