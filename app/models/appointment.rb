class Appointment < ActiveRecord::Base
  belongs_to :client

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

    client = Client.find_or_create_by(
      name: apptData[:name],
      email: apptData[:email],
      phone: apptData[:phone]
    )

    new_appt = Appointment.create(
                time: DateTime.parse(apptData[:time]),
                package: apptData[:package],
                price: price,
                client: client
              )
  end
end