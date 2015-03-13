class ActivityType < ActiveRecord::Base
  belongs_to  :employee
  has_one     :studio, :through => :employee


  def generate_estimate_params
    purged_attributes = Estimate.purge_unwanted_attributes(self)
    estimate_params = {}
    activities = purged_attributes.values.select {|activity| activity.is_a? String}
    activities = activities.join(', ')
    estimate_params['studio_activities'] = activities
    
    return estimate_params
  end

end
