# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

LineItem.delete_all
Cart.delete_all
Product.delete_all

namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      puts "seeding - #{filename}."
      load(filename)
    end
  end
end

# Create a cart
cart = Cart.new

# Create a line-item for the cart
product = Product.first

LineItem.create(cart: cart, product: product, quantity: 1)

puts "Status:\nProducts #{Product.count}\nCarts: #{Cart.count}\nLineItems: #{LineItem.count}\n"
