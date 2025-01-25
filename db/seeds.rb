# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: "nusay@gmail.com", password: "123456")
Virus.create(name: "Ebola", description: "Causes severe hemorrhagic fever with a high fatality rate. Transmitted through contact with infected bodily fluids.", price: 100)
Virus.create(name: "Covid-19", description: "A coronavirus that emerged in 2019, causing the COVID-19 pandemic. Symptoms range from mild (fever, cough) to severe (respiratory distress).", price: 120)
Virus.create(name: "Influenza Virus", description: "A respiratory virus that causes seasonal flu outbreaks. Symptoms include fever, cough, muscle aches, and fatigue.", price: 180)
Virus.create(name: "Dengue", description: "A mosquito-borne virus causing dengue fever, characterized by high fever, severe headaches, joint pain, and rash.", price: 110)
Virus.create(name: "Zika", description: "A mosquito-borne virus causing mild symptoms in adults but linked to severe birth defects (microcephaly) when contracted during pregnancy.", price: 190)
Virus.create(name: "Smallpox (Variola)", description: "A virus causing high fever, pustular rash, and often death. Declared eradicated in 1980 through global vaccination efforts.", price: 160)
