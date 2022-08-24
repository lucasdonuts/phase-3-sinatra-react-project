class Appointment < ActiveRecord::Base
  belongs_to :client

  # class methods
  def self.make_appt(apptData)

    price = 0

    case apptData[:package]
    when '1'
      price = 15
    when '2'
      price = 35
    when '3'
      price = 75
    end

    client = Client.create_with(name: apptData[:name], phone: apptData[:phone]).find_or_create_by(email: apptData[:email])

    new_appt = Appointment.create(
                time: apptData[:time],
                package: apptData[:package],
                price: price,
                client: client
              )
  end

  def self.get_my_appts(email)
    client = Client.find_by(email: email)
    Appointment.where(client: client)
  end
end