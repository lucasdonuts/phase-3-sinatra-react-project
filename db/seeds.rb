Client.destroy_all
Appointment.destroy_all

Client.reset_pk_sequence
Appointment.reset_pk_sequence

Faker::Name.unique.clear
Faker::Internet.unique.clear
Faker::PhoneNumber.unique.clear

puts "🌱 Seeding..."

10.times do
  Client.create(
    name: Faker::Name.unique.male_first_name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.unique.cell_phone
  )
end

# 10.times do
  # Appointment.create()
# end

puts "✅ Done seeding!"
