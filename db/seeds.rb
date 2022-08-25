Client.destroy_all
Appointment.destroy_all

Client.reset_pk_sequence
Appointment.reset_pk_sequence

Faker::Name.unique.clear
Faker::Internet.unique.clear
Faker::PhoneNumber.unique.clear

TIMES = ['12:00', '12:30', '1:00', '1:30', '2:00', '2:30', '3:00', '3:30', '4:00', '4:30']

puts "🌱 Seeding..."

10.times do
  Client.create(
    name: Faker::Name.unique.male_first_name,
    # email: Faker::Internet.unique.email,
    email: "#{('a'..'z').to_a.sample}@e.com",
    phone: Faker::PhoneNumber.unique.cell_phone
  )
end

5.times do # |i|
  Appointment.make_appt(
    client: Client.all.sample,
    time: TIMES[*(0..9).to_a.shuffle.take(1)],
    package: rand(1..3).to_s
  )
  
  # i = 0 if i == 9
end

puts "✅ Done seeding!"
