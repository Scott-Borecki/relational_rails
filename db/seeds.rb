# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NationalPark.destroy_all
Trail.destroy_all

denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, seasonal: true)
katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, seasonal: true)
kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, seasonal: true)

denali.trail.create!(name: 'Triple Lakes Trail', length: 9, loop: false)
denali.trail.create!(name: 'Quadruple Lakes Trail', length: 12, loop: false)
katmai.trail.create!(name: 'Double Lakes Trail', length: 6, loop: true)
kenai_fjords.trail.create!(name: 'Single Lake Trail', length: 3, loop: true)
