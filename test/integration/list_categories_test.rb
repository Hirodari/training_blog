require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "movies")
  end

  test "show category listing test " do
    get categories_path
    assert_template 'categories/index'
    assert_select 'div.card-header'
  end
end
