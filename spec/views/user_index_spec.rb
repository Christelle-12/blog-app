require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before do
    # Create some test users and their posts here using FactoryBot or any other preferred method
  end

  scenario 'I can see the username of all other users' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_css("img[src='#{user.photo}']") if user.photo.present?
    end
  end

  scenario 'I can see the number of posts each user has written' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  scenario 'When I click on a user, I am redirected to that user s show page' do
    User.all.each do |_user|
      click_link(href: user_path(@user))
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
