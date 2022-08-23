class AppointmentsController < ApplicationController
  get '/appointments' do
    appointments = Appointment.all
    appointments.to_json
  end

  post '/appointments' do
    appt = Appointment.make_appt(appt_params)
    appt.to_json
  end

  def appt_params
    {
      name: params[ :name ],
      email: params[ :email ],
      phone: params[ :phone ],
      time: params[ :time ],
      package: params[ :package ]
    }
  end

end