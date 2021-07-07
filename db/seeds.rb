# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trail.destroy_all
NationalPark.destroy_all

denali = NationalPark.create!(name: 'Denali', acreage: 6_100_000, is_seasonal: true)
katmai = NationalPark.create!(name: 'Katmai', acreage: 4_093_077, is_seasonal: true)
kenai_fjords = NationalPark.create!(name: 'Kenai Fjords', acreage: 669_984, is_seasonal: true)

denali.trails.create!(name: 'Triple Lakes Trail', length: 9, is_loop: false)
denali.trails.create!(name: 'Quadruple Lakes Trail', length: 12, is_loop: false)
katmai.trails.create!(name: 'Double Lakes Trail', length: 6, is_loop: true)
kenai_fjords.trails.create!(name: 'Single Lake Trail', length: 3, is_loop: true)
