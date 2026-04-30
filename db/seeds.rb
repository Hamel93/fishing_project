puts "Cleaning database..."
Lure.destroy_all
Fish.destroy_all

puts "Creating fishes..."

trout = Fish.create!(name: "Truite", species: "Eau douce")
salmon = Fish.create!(name: "Saumon", species: "Rivière")
pike = Fish.create!(name: "Brochet", species: "Lac")

puts "Creating lures..."

Lure.create!(name: "Cuillère argentée", lure_type: "spoon", fish: trout)
Lure.create!(name: "Leurre souple", lure_type: "soft", fish: pike)
Lure.create!(name: "Poisson nageur", lure_type: "hardbait", fish: salmon)

puts "Done!"
