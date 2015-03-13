class Estimate < ActiveRecord::Base
  has_many :fixed_costs, :dependent => :destroy
  has_many :operating_costs, :dependent => :destroy

  def self.generate_params_from(objects)
    estimate_params = {}
    objects.each do |object|  
      params = object.generate_estimate_params 
      params.each { |k,v| estimate_params[k] = v }
    end
    return estimate_params
  end

  def self.purge_unwanted_attributes(object)

    excluded_attributes = ['id','created_at','updated_at','fixed_cost_id','operating_cost_id','employee_id','studio_id','estimate_id']
    purged_attributes = {}

    object.attributes.each do |attribute, value|
      unless excluded_attributes.include?(attribute)
        purged_attributes[ attribute ] = value
      end
    end

    return purged_attributes
  end

end
