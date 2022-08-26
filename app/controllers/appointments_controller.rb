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
    appt = Appointment.find(params[:id])
    appt.update(update_params)
    appt.to_json
  end

  delete '/appointments/:id' do
    appt = Appointment.find( params[:id] )
    appt.destroy
  end

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
    case params[:package]
    when '1'
      price = 15
    when '2'
      price = 35
    when '3'
      price = 75
    end
    {
      time: params[ :time ],
      package: params[ :package ],
      price: price
    }
  end
end