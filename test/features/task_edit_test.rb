require_relative '../test_helper'

class UserEditsTaskTest < FeatureTest
  def test_user_edits_a_task
    visit '/'
    click_link_or_button('New Index')
    assert_equal '/tasks/new', current_path
    fill_in('task[title]', with: 'pineapple')
    fill_in('task[description]', with: 'juicy')
    click_link_or_button('submit')
    assert_equal '/tasks', current_path
    click_link_or_button('Edit')
    fill_in('task[title]', with: 'crackers')
    fill_in('task[description]', with: 'crunchy')
    click_link_or_button('submit')
    assert_equal '/tasks/1', current_path
    assert page.has_content? ('crackers')
    assert page.has_content? ('crunchy')
    visit '/tasks'
    assert page.has_content? ('crackers')
  end
end
