# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Store.create(name: "Seeds, seeds,seeds", store_owner: "Anne", product:"Seeds of all types")
Store.create(name: "Veritable Vegetables", store_owner: "Seth", product: "Seedlings")
Store.create(name: "Fluorescent flowers", store_owner: "Annise", product:"Flowers that are bright")

product_title = ["Seed packet", "Seedlings", "Potting Soil", "Gardening Gloves", "Planters"]
product_description = ["Packet of seeds", "Plants about four inches tall", "Soil for planting in", "Gloves to keep your hands nice", "A pot to plant in"]

10.times do
	Product.create(title: product_title.sample,
					description: product_description.sample,
					price: rand(1..10))
end