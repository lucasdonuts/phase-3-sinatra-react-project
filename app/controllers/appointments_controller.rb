class AppointmentsController < ApplicationController
  get '/appointments' do
    appointments = Appointment.all
    appointments.to_json
  end

  post '/appointments' do
    appt = Appointment.make_appt(create_params)
    appt.to_json
  end

  patch '/appointments/:id' do
    appt = Appointment.update(update_params)
    appt.to_json
  end

  # def appt_params
  #   {
  #     name: params[ :name ],
  #     email: params[ :email ],
  #     phone: params[ :phone ],
  #     time: params[ :time ],
  #     package: params[ :package ]
  #   }
  # end
  def create_params
    {
      name: params[ :name ],
      email: params[ :email ],
      phone: params[ :phone ],
      time: params[ :time ],
      package: params[ :package ]
    }
  end

  def update_params
    {
      time: params[ :time ],
      package: params[ :package ]
    }
  end
end