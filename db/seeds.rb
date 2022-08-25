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
    email: "#{('a'..'z').to_a.shuffle.take(1).first}@e.com",
    phone: Faker::PhoneNumber.unique.cell_phone
  )
end

puts "✅ Done seeding!"
