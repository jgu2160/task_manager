require_relative '../test_helper'
require 'minitest/pride'

class FrontPageTest < FeatureTest
  def teardown;end

  def test_user_sees_greeting
  	visit '/'
  	assert page.has_content?("Welcome to t-manager")
  end

  def test_user_sees_index_and_new_links
  	visit '/'
  	within ("#greeting") do
  		assert page.has_content?("Welcome to t-manager")
  	end
  end

  def test_user_finds_links
    visit '/'
    assert page.find_link("New Index").visible?
    assert page.find_link("Task Index").visible?
  end
end
