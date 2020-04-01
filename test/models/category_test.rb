require "test_helper"
#ActiveSupport
class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert_not @category2.valid?
  end

  test "name should be too short" do
    @category.name = "aa"
    @category.save
    assert_not @category.valid?
  end

  test "name should be too long" do
    @category.name = "aa" * 26
    @category.save
    assert_not @category.valid?
  end

end
