# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Campground.destroy_all
Campsite.destroy_all

riley = Campground.create!({name: 'Riley Creek Campground', reservation_allowed: true, max_nights: 14})
igloo = Campground.create!({name: 'Igloo Creek Campground', reservation_allowed: false, max_nights: 14})

riley.campsite.create!({name: 'Site B', tent_only: false, overnight_fee: 27})
riley.campsite.create!({name: 'Site A', tent_only: false, overnight_fee: 34})
igloo.campsite.create!({name: 'Site 1', tent_only: true, overnight_fee: 17})
igloo.campsite.create!({name: 'Site 2', tent_only: true, overnight_fee: 17})
