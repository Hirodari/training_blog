require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get new_category_path # this is the routing test
    #gem 'rails-controller-testing' should be install 'bundle install'
    assert_template 'categories/new' # this is checking if the template exist
    assert_difference 'Category.count', 1 do # this for checking how many params involve
      #while posting create sport category
      post categories_path, params: {category:{name: "sports"}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "get invalid create category test" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference "Category.count" do
      post categories_path params: {category: {name: ""}}
    end
    assert_template 'categories/new'
    assert_select 'li.list-group-item.list-group-item-danger'
    assert_select 'li.list-group-item'
  end
end
