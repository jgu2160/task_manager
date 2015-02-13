require_relative '../test_helper'

class UserDeletesTaskTest < FeatureTest
  def teardown; end
  def test_user_deletes_a_task
    visit '/'
    click_link_or_button('New Index')
    assert_equal '/tasks/new', current_path
    fill_in('task[title]', with: 'pineapple')
    fill_in('task[description]', with: 'juicy')
    click_link_or_button('submit')
    assert_equal '/tasks', current_path
    within('#1') do
      click_link_or_button("delete")
    end
    refute page.has_content?("pineapple")
  end
end
