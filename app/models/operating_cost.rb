class OperatingCost < ActiveRecord::Base
  belongs_to :employee

  has_one    :studio, :through => :employee

  def calculate_sum
    excluded_attributes = ['id','created_at','updated_at']
    sum = 0
    self.attributes.each do |attribute,value|
      unless excluded_attributes.include?(attribute) 
        sum += value
      end
    end
    return sum
  end
  
end
