# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
WikiPost.create!(title: "EUNOIA", description: "Its a greek word which means beautiful thinking. It is the shortest word in the english language that contains all five vowels.", author: "Zahra")
WikiPost.create(title: "Trust", description: "A firm belief in the reliability, truth, or ability of someone or something.", author: "Z")
WikiPost.create(title: "Happiness", description: "A state of well-being characterized by emotions ranging from contentment to intense joy.", author: "Hajra")
WikiPost.create(title: "Friendship", description: "A relationship of mutual affection between people.", author: "Zainab")
WikiPost.create(title: "Kindness", description: "The quality of being friendly, generous, and considerate.", author: "Fatima")
