# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Category.create([
	{name: "Action Figure"},
	{name: "Puzzle"},
	{name: "LEGO"},
	{name: "Stuffed Toy"},
	{name: "Pop Figure"},
	{name: "Lord of The Rings"},
	{name: "Harry Potter"},
	{name: "Game of Thrones"},
	{name: "Star Wars"},
	{name: "Rick and Morty"},
	{name: "Doctor Who"},
	{name: "Elder Scrolls"},
	{name: "Witcher"},
	{name: "Overwatch"},
	{name: "Pokemon"}
	])

#Lord of The Rings
	#Action Figure
	begin
		50.times do
			itemName = Faker::LordOfTheRings.unique.character
			@entry = Product.create(
				name: "#{itemName} Action Figure",
				description: "Action Figure of #{itemName} from the Middle Earth.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 100,
				discount: 0,
				stock_quantity: 250 
				)
			@entry.categories << Category.find_by_name("Action Figure")
			@entry.categories << Category.find_by_name("Lord of The Rings")
		end
	rescue
	end

	#Puzzle
	begin
		50.times do
			itemName = Faker::LordOfTheRings.unique.location
			@entry = Product.create(
				name: "#{itemName} Puzzle",
				description: "1024-piece jigsaw puzzle of #{itemName}.",
				dist_info: "Onat Coorp.",
				warranty_status: "5 Years",
				model_number: Faker::Number.unique.number(8),
				price: 49.99,
				discount: 0,
				stock_quantity: 500
				)
			@entry.categories << Category.find_by_name("Puzzle")
			@entry.categories << Category.find_by_name("Lord of The Rings")
		end
	rescue
	end

#Harry Potter
	#Action Figure
	begin
		50.times do
			itemName = Faker::HarryPotter.unique.character
			@entry = Product.create(
				name: "#{itemName} Action Figure",
				description: "Action Figure of #{itemName} from the Harry Potter.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 100,
				discount: 0,
				stock_quantity: 250 
				)
			@entry.categories << Category.find_by_name("Action Figure")
			@entry.categories << Category.find_by_name("Harry Potter")	
		end
	rescue
	end

	#Puzzle
	begin
		50.times do
			itemName = Faker::HarryPotter.unique.location
			@entry = Product.create(
				name: "#{itemName} Puzzle",
				description: "1024-piece jigsaw puzzle of #{itemName}.",
				dist_info: "Onat Coorp.",
				warranty_status: "5 Years",
				model_number: Faker::Number.unique.number(8),
				price: 49.99,
				discount: 0,
				stock_quantity: 500
				)
			@entry.categories << Category.find_by_name("Puzzle")
			@entry.categories << Category.find_by_name("Harry Potter")
		end
	rescue
	end

#Game of Thrones
	#Action Figure
	begin
		50.times do
			itemName = Faker::GameOfThrones.unique.character
			@entry = Product.create(
				name: "#{itemName} Action Figure",
				description: "Action Figure of #{itemName} from the world of Game of Thrones.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 100,
				discount: 0,
				stock_quantity: 250 
				)
			@entry.categories << Category.find_by_name("Action Figure")
			@entry.categories << Category.find_by_name("Game of Thrones")			
		end
	rescue
	end

	#Puzzle
	begin
		50.times do
			itemName = Faker::GameOfThrones.unique.city
			@entry = Product.create(
				name: "#{itemName} Puzzle",
				description: "1024-piece jigsaw puzzle of #{itemName}.",
				dist_info: "Onat Coorp.",
				warranty_status: "5 Years",
				model_number: Faker::Number.unique.number(8),
				price: 49.99,
				discount: 0,
				stock_quantity: 500
				)
			@entry.categories << Category.find_by_name("Puzzle")
			@entry.categories << Category.find_by_name("Game of Thrones")			
		end
	rescue
	end

#Star Wars
	#Action Figure
	begin
		50.times do
			itemName = Faker::StarWars.unique.character
			@entry = Product.create(
				name: "#{itemName} Action Figure",
				description: "Action Figure of #{itemName} from Star Wars universe.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 100,
				discount: 0,
				stock_quantity: 250 
				)
			@entry.categories << Category.find_by_name("Action Figure")
			@entry.categories << Category.find_by_name("Star Wars")
		end
	rescue
	end
	
	#Puzzle
	begin
		50.times do
			itemName = Faker::StarWars.unique.planet
			@entry = Product.create(
				name: "#{itemName} Puzzle",
				description: "1024-piece jigsaw puzzle of #{itemName}.",
				dist_info: "Onat Coorp.",
				warranty_status: "5 Years",
				model_number: Faker::Number.unique.number(8),
				price: 49.99,
				discount: 0,
				stock_quantity: 500
				)
			@entry.categories << Category.find_by_name("Puzzle")
			@entry.categories << Category.find_by_name("Star Wars")
		end
	rescue
	end
	
	#Vehicle Lego
	begin
		50.times do
			itemName = Faker::StarWars.unique.vehicle
			@entry = Product.create(
				name: "#{itemName} LEGO",
				description: "LEGO model of the #{itemName} vehicle.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 150,
				discount: 0,
				stock_quantity: 300
				)
			@entry.categories << Category.find_by_name("LEGO")
			@entry.categories << Category.find_by_name("Star Wars")
		end
	rescue
	end

	#Specie Stuffed Toy
	begin
		50.times do
			itemName = Faker::StarWars.unique.specie
			@entry = Product.create(
				name: "#{itemName} Stuffed Toy",
				description: "Adorable toy model of #{itemName} from the Star Wars universe.",
				dist_info: "Furkan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 60,
				discount: 0,
				stock_quantity: 450
				)
			@entry.categories << Category.find_by_name("Stuffed Toy")
			@entry.categories << Category.find_by_name("Star Wars")
		end
	rescue
	end

#Rick and Morty
	#Pop Figure
	begin
		50.times do
			itemName = Faker::RickAndMorty.unique.character
			@entry = Product.create(
				name: "#{itemName} Pop Figure",
				description: "Pop Figure of #{itemName} from Rick and Morty.",
				dist_info: "Sinan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 50,
				discount: 0,
				stock_quantity: 200 
				)
			@entry.categories << Category.find_by_name("Pop Figure")
			@entry.categories << Category.find_by_name("Rick and Morty")
		end
	rescue
	end

#Doctor Who
	#Action Figure
	begin
		50.times do
			itemName = Faker::DrWho.unique.character
			@entry = Product.create(
				name: "#{itemName} Action Figure",
				description: "Action Figure of #{itemName} from Doctor Who.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 100,
				discount: 0,
				stock_quantity: 250 
				)
			@entry.categories << Category.find_by_name("Action Figure")
			@entry.categories << Category.find_by_name("Doctor Who")
		end
	rescue
	end

#Elder Scrolls
	#Puzzle
	begin
		50.times do
			itemName = Faker::ElderScrolls.unique.city
			@entry = Product.create(
				name: "#{itemName} Puzzle",
				description: "1024-piece jigsaw puzzle of #{itemName}.",
				dist_info: "Onat Coorp.",
				warranty_status: "5 Years",
				model_number: Faker::Number.unique.number(8),
				price: 49.99,
				discount: 0,
				stock_quantity: 500
				)
			@entry.categories << Category.find_by_name("Puzzle")
			@entry.categories << Category.find_by_name("Elder Scrolls")
		end
	rescue
	end
	
	#Stuffed Toy
	begin
		50.times do
			itemName = Faker::ElderScrolls.unique.creature 
			@entry = Product.create(
				name: "#{itemName} Stuffed Toy",
				description: "Adorable toy model of #{itemName} from Tamriel.",
				dist_info: "Furkan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 60,
				discount: 0,
				stock_quantity: 450
				)
			@entry.categories << Category.find_by_name("Stuffed Toy")
			@entry.categories << Category.find_by_name("Elder Scrolls")
		end
	rescue
	end

#Witcher
	#Action Figure
	begin
		50.times do
			itemName = Faker::Witcher.unique.character
			@entry = Product.create(
				name: "#{itemName} Action Figure",
				description: "Action Figure of #{itemName} from the Witcher universe.",
				dist_info: "Bilge Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 100,
				discount: 0,
				stock_quantity: 250 
				)
			@entry.categories << Category.find_by_name("Action Figure")
			@entry.categories << Category.find_by_name("Witcher")

			
		end
	rescue
	end

	#Puzzle
	begin
		50.times do
			itemName = Faker::Witcher.unique.location
			@entry = Product.create(
				name: "#{itemName} Puzzle",
				description: "1024-piece jigsaw puzzle of #{itemName}.",
				dist_info: "Onat Coorp.",
				warranty_status: "5 Years",
				model_number: Faker::Number.unique.number(8),
				price: 49.99,
				discount: 0,
				stock_quantity: 500
				)
			@entry.categories << Category.find_by_name("Puzzle")
			@entry.categories << Category.find_by_name("Witcher")
		end
	rescue
	end
	
	#Pop Figure
	begin
		50.times do
			itemName = Faker::Witcher.unique.character
			@entry = Product.create(
				name: "#{itemName} Pop Figure",
				description: "Pop Figure of #{itemName} from the Witcher universe.",
				dist_info: "Sinan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 50,
				discount: 0,
				stock_quantity: 200 
				)
			@entry.categories << Category.find_by_name("Pop Figure")
			@entry.categories << Category.find_by_name("Witcher")
		end
	rescue
	end

	#Stuffed Toy
	begin
		50.times do
			itemName = Faker::Witcher.unique.monster  
			@entry = Product.create(
				name: "#{itemName} Stuffed Toy",
				description: "Adorable toy model of #{itemName} from the Witcher universe.",
				dist_info: "Furkan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 60,
				discount: 0,
				stock_quantity: 450
				)
			@entry.categories << Category.find_by_name("Stuffed Toy")
			@entry.categories << Category.find_by_name("Witcher")
		end
	rescue
	end

#Overwatch
	#Pop Figure
	begin
		50.times do
			itemName = Faker::Overwatch.unique.hero
			@entry = Product.create(
				name: "#{itemName} Pop Figure",
				description: "Pop Figure of #{itemName} from Overwatch.",
				dist_info: "Sinan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 50,
				discount: 0,
				stock_quantity: 200 
				)
			@entry.categories << Category.find_by_name("Pop Figure")
			@entry.categories << Category.find_by_name("Overwatch")
		end
	rescue
	end

#Pokemon
	#Stuffed Toy
	begin
		50.times do
			itemName = Faker::Pokemon.unique.name  
			@entry = Product.create(
				name: "#{itemName} Stuffed Toy",
				description: "Adorable toy model of #{itemName} from Pokemon.",
				dist_info: "Furkan Coorp.",
				warranty_status: "2 Years",
				model_number: Faker::Number.unique.number(8),
				price: 60,
				discount: 0,
				stock_quantity: 450
				)
			@entry.categories << Category.find_by_name("Stuffed Toy")
			@entry.categories << Category.find_by_name("Pokemon")
		end
	rescue
	end
