# frozen_string_literal: true

require_relative '../../application_system_test_case'

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = create(:course)
  end

  test 'visiting the index' do
    visit courses_url
    assert_selector 'h1', text: 'Courses'
  end

  test 'creating a Course' do
    visit courses_url
    click_on 'New Course'

    fill_in 'Code', with: @course.code
    fill_in 'Creator', with: @course.creator_id
    fill_in 'Desc', with: @course.desc
    fill_in 'Intro', with: @course.intro
    fill_in 'Juniors count', with: @course.juniors_count
    fill_in 'Mold', with: @course.mold
    fill_in 'Name', with: @course.name
    fill_in 'Prev', with: @course.prev_id
    fill_in 'Status', with: @course.status
    fill_in 'Superior', with: @course.superior_id
    click_on 'Create Course'

    assert_text 'Course was successfully created'
    click_on 'Back'
  end

  test 'updating a Course' do
    visit courses_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @course.code
    fill_in 'Creator', with: @course.creator_id
    fill_in 'Desc', with: @course.desc
    fill_in 'Intro', with: @course.intro
    fill_in 'Juniors count', with: @course.juniors_count
    fill_in 'Mold', with: @course.mold
    fill_in 'Name', with: @course.name
    fill_in 'Prev', with: @course.prev_id
    fill_in 'Status', with: @course.status
    fill_in 'Superior', with: @course.superior_id
    click_on 'Update Course'

    assert_text 'Course was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Course' do
    visit courses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Course was successfully destroyed'
  end
end
