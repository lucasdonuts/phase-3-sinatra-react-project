class Appointment < ActiveRecord::Base
  belongs_to :client

  def self.make_appointment(time, package, client_name)
    client = Client.find_or_create_by(name: client_name)
    new_appt = Appointment.create(
                time: DateTime.parse(time),
                package: package,
                price: package * 20,
                client: client
              )
  end

  # Possible way to set price dynamically
  # def initialize(time, package_num)
  #   @price = 20 + 20 * package_num
  # end
end