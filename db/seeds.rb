# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  User.find_or_initialize_by(email: "public.gma@gmail.com")
    .update(admin: true,
            first_name: "Gene",
            last_name: "Angelo",
            password: "password",
    )
end

# Units of liquid and dry measurements.
Measurement.find_or_initialize_by(name: "Teaspoon").update(abbreviation: "t")
Measurement.find_or_initialize_by(name: "Tablespoon").update(abbreviation: "tbs")
Measurement.find_or_initialize_by(name: "Gram").update(abbreviation: "gm")
Measurement.find_or_initialize_by(name: "Ounce").update(abbreviation: "oz")
Measurement.find_or_initialize_by(name: "Pound").update(abbreviation: "lb")
Measurement.find_or_initialize_by(name: "Cup").update(abbreviation: "c")
Measurement.find_or_initialize_by(name: "Pint").update(abbreviation: "pt")
Measurement.find_or_initialize_by(name: "Quart").update(abbreviation: "qt")
Measurement.find_or_initialize_by(name: "Gallon").update(abbreviation: "gal")
Measurement.find_or_initialize_by(name: "Peck").update(abbreviation: "pk")
Measurement.find_or_initialize_by(name: "Bushel").update(abbreviation: "bsh")
Measurement.find_or_initialize_by(name: "Barrel").update(abbreviation: "bbl")
Measurement.find_or_initialize_by(name: "Box").update(abbreviation: "box")
Measurement.find_or_initialize_by(name: "Bag").update(abbreviation: "bag")
Measurement.find_or_initialize_by(name: "Carton").update(abbreviation: "ctn")
Measurement.find_or_initialize_by(name: "Other").update(abbreviation: "other")
