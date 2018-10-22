# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(login: 'admin', is_admin: true, password: 'aezakmi', password_confirmation: 'aezakmi')
User.create(login: 'user', is_admin: false, password: 'user', password_confirmation: 'user')

# Installation.create(name: 'Jeleń Kościół', sensor_id: '2290')
# Installation.create(name: 'Jeleń Wygoda', sensor_id: '2953')
# Installation.create(name: 'Pieczyska Szkoła', sensor_id: '2735')
# Installation.create(name: 'Byczyna', sensor_id: '2311')