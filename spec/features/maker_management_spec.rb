require 'spec_helper'
require_relative '../helpers/session'

include SessionHelpers

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

end

feature 'Maker signs in' do

  before(:each) do
    Maker.create(:username => 'the_one',
                 :password => 'shazzam',
                 :password_confirmation => 'shazzam')
  end

  scenario 'with correct details' do
    visit '/'
    expect(page).not_to have_content('Pa-ching! Welcome to Chitter the_one!')
    sign_in('the_one', 'shazzam')
    expect(page).to have_content('Pa-ching! Welcome to Chitter the_one!')
  end

  scenario 'with incorrect details' do
    visit '/'
    expect(page).not_to have_content('Pa-ching! Welcome to Chitter the_one!')
    sign_in('the_one', 'ooopsss')
    expect(page).not_to have_content('Pa-ching! Welcome to Chitter the_one!')
  end
end

feature 'Maker signs out' do
   before(:each) do
    Maker.create(:username => 'the_one',
                 :password => 'shazzam',
                 :password_confirmation => 'shazzam')
   end

  scenario 'while signed in, user signs out' do
    sign_in('the_one', 'shazzam')
    click_button 'Sign out'
    expect(page).to have_content('Adios!')
    expect(page).not_to have_content('Welcome to Chitter the_one!')
  end
end
