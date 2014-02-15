require 'spec_helper'

feature 'Maker signs up' do

  scenario 'when being logged out' do
    lambda { sign_up }.should change(Maker, :count).by(1)

    expect(page).to have_content('Pa-ching! Welcome to Chitter the_one!')
    expect(Maker.first.email).to eq('master@example.com')
    expect(Maker.first.username).to eq('the_one')
  end

  def sign_up(name = 'master',
              username = 'the_one',
              email = 'master@example.com',
              password = 'shazzam')
    visit '/makers/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button 'Sign up'
  end
end
