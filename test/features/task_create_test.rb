require_relative '../test_helper'

class UserCreatesTaskTest < FeatureTest
  def test_user_creates_a_task
    visit '/'
    click_link_or_button('New Index')
    assert_equal '/tasks/new', current_path
    fill_in('task[title]', with: 'pineapple')
    fill_in('task[description]', with: 'juicy')
    click_link_or_button('submit')
    assert_equal '/tasks', current_path
    within('#tasks') do
      assert page.has_content?("pineapple")
    end
  end
end
