require 'test_helper'

class EpostcardTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @page = pages(:page_one)
    @epostcard = Epostcard.new(name: "Sample", page_id: @page.id)
  end

  test "should be valid" do
    assert @epostcard.valid?
  end

  test "user id should be present" do
    @epostcard.page_id = nil
    assert_not @epostcard.valid?
  end
  
end
