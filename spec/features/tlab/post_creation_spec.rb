require 'spec_helper'

feature 'spec creation' do

  scenario 'creating a valid post' do
    expect do
      visit new_post_path
      fill_in 'Title', with: 'sups'
      fill_in 'Body', with: '<p>Hey its my body!</p>'
      fill_in 'Preview', with: '<i>Just a preview</i>'
      click_button 'Create Post'
    end.to change { Tlab::Post.count }.by(1)
  end

end
