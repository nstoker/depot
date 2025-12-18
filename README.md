# README

Following the Agile Web Development With Rails 8 book

Working through Task A: Creating the Application.

Working through Task B: Validation and Unit Testing
B2 Unit testing of model
Started Task C: Catalog C Display
Iteration C2: Page Layout
Iteration C3: Using a helper to Format price
Iteration C4: Functional Testing of Controllers
Iteration C5: Caching of partial results

Task D: Cart creation
Iteration D1: Finding a cart
Iteration D2: Connecting products to carts
Iteration D3: Adding a Button

## Notes
`bin/rails test test/controllers/line_items_controller_test.rb:18`

## Bugs
```

### Failing test
```bin/rails​​ ​​test​​ ​​test/controllers/line_items_controller_test.rb​```

LineItemsControllerTest#test_should_create_line_item [test/controllers/line_items_controller_test.rb:19]:
`LineItem.count` didn't change by 1, but by 0.
Expected: 3
  Actual: 2
  ```
