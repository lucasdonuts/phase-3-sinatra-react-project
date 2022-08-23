class Client < ActiveRecord::Base
  has_many :appointments, dependent: :destroy

  def get_appts
    self.appointments
  end
end