class Appointment < ActiveRecord::Base
  belongs_to :client

  # Possible way to set price dynamically
  # def initialize(time, package_num)
  #   @price = 20 + 20 * package_num
  # end
end