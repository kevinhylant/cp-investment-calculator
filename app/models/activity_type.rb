class ActivityType < ActiveRecord::Base
  belongs_to  :employee
  has_one     :studio, :through => :employee
end
