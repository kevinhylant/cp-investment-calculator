class FixedCost < ActiveRecord::Base
  belongs_to :studio

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
