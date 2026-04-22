puts "Cleaning database..."
FishingTrip.destroy_all
Lake.destroy_all

puts "Creating lakes..."

Lake.create!(
  name: "Lac Saint-Jean",
  region: "Saguenay–Lac-Saint-Jean",
  latitude: 48.4333,
  longitude: -72.0667,
  fish_data: ["walleye", "northern pike", "lake trout"],
  lure_data: {
    "walleye" => ["jig", "soft plastic"],
    "northern pike" => ["spinnerbait", "crankbait"],
    "lake trout" => ["spoon", "deep jig"]
  },
  description: "Large iconic lake in Quebec."
)

Lake.create!(
  name: "Memphrémagog",
  region: "Estrie",
  latitude: 45.0000,
  longitude: -72.2000,
  fish_data: ["salmon", "trout", "bass"],
  lure_data: {
    "salmon" => ["minnow bait", "spoon"],
    "trout" => ["spinner", "spoon"],
    "bass" => ["topwater", "soft plastic"]
  },
  description: "Popular fishing lake in southern Quebec."
)

puts "Done."
