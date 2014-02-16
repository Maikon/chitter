require 'spec_helper'

feature 'Maker signs up' do

  scenario 'when being logged out' do
    lambda { sign_up }.should change(Maker, :count).by(1)

    expect(page).to have_content('Pa-ching! Welcome to Chitter the_one!')
    expect(Maker.first.email).to eq('master@example.com')
    expect(Maker.first.username).to eq('the_one')
  end

  scenario 'with password that doesn\'t match' do
    lambda { sign_up('master', 'the_one', 'master@example.com', 'shazzam', 'kapoom') }.should change(Maker, :count).by(0)
    expect(current_path).to eq('/makers')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with email that is already registered' do
    lambda { sign_up }.should change(Maker, :count).by(1)
    lambda { sign_up }.should change(Maker, :count).by(0)
    expect(page).to have_content('This email has already been used')
  end

  scenario 'with username that is already registered' do
    lambda { sign_up }.should change(Maker, :count).by(1)
    lambda { sign_up }.should change(Maker, :count).by(0)
    expect(page).to have_content('This username has already been used')
  end

  def sign_up(name = 'master',
              username = 'the_one',
              email = 'master@example.com',
              password = 'shazzam',
              password_confirmation = 'shazzam')
    visit '/makers/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button 'Sign up'
  end
end
