require 'spec_helper'

feature 'next and previous post links' do

  given! :first_post do
    Tlab::Post.create!(slug: 'first', published_at: Time.now, title: 'first', body: 'this is the first post' )
  end

  given! :second_post do
    Tlab::Post.create!(slug: 'second', published_at: Time.now + 1, title: 'second', body: 'the second' )
  end

  given! :third_port do
    Tlab::Post.create!(slug: 'third', published_at: Time.now + 2, title: 'third', body: 'the third' )
  end

  subject { page }

  scenario 'visiting the second page form the first post' do
    visit post_path first_post
    should have_content 'first'
    should have_link 'Next'
    should_not have_link 'Previous'
    click_link 'Next'
    should have_content 'second'
  end

  scenario 'visiting the first page form the second post' do
    visit post_path second_post
    should have_content 'second'
    should have_link 'Previous'
    should have_link 'Next'
    click_link 'Previous'
    should have_content 'first'
  end
end

