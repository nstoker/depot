require "test_helper"

class CartTest < ActiveSupport::TestCase
#  Write unit tests that add both unique products and duplicate products to a cart. Assert how many products should be in the cart in each instance. Note that you'll need to modify the fixture to refer to products and carts by name -- for example, `product: pragprog`.
fixtures :products

  test "can add a single item to a cart" do
    cart = Cart.new
    product=products(:pragprog)
    cart.add_product(product, product.price)
    assert cart.save

    assert_equal 1, cart.line_items.count
    assert_equal 1, cart.line_items.find_by(product_id: products(:pragprog).id).quantity
    assert_equal product.price, cart.total_price
  end

  test "can't add duplicate items to a cart" do
    # create cart with one line item
    cart = Cart.new
    product = products(:pragprog)
    cart.add_product(product, product.price).save

    cart.add_product(product, product.price).save

    assert_equal 1, cart.line_items.count
    assert_equal 2, cart.line_items.find_by(product: product.id).quantity, "quantity has not increased"
    assert_equal 79.98, cart.total_price
  end
end
