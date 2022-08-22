class AppointmentsController < ApplicationController
  get '/appointments' do
    appointments = Appointment.all
    appointments.to_json
  end
end