require 'csv'

filename="db/seeds/products.csv"

CSV.foreach(filename, headers: true) do |row|
  # puts "#{row.to_hash.inspect}"
  p = Product.new
  hash=row.to_hash
  # puts hash.inspect
  # puts hash["title"].inspect

  p.title = hash["title"]
  p.description = hash["description"]
  p.price = hash["price"]
  p.image.attach(io: File.open(Rails.root.join(hash["image"])), filename: hash["image"], content_type: "image/png")
  p.save!

  puts "products seeded."
end
