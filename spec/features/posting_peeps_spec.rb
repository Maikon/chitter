require 'spec_helper'
require_relative '../helpers/session'

include SessionHelpers

feature 'Maker posts a peep' do

  scenario 'when on the homepage' do
    Maker.create(:username => 'the_one',
                 :password => 'shazzam',
                 :password_confirmation => 'shazzam')
    expect(Peep.count).to eq(0)
    visit '/'
    sign_in('the_one', 'shazzam')
    post_peep('Hello World!')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.body).to eq('Hello World!')
  end

  scenario 'when not signed in' do
    visit '/'
    expect(page).not_to have_css('#new_peep')
  end
end

def post_peep(body)
  within('#new_peep') do
    fill_in 'body', :with => body
    click_button 'Peep it!'
  end
end
