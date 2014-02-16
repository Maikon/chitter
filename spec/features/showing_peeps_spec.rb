require 'spec_helper'

feature 'Maker sees the list of peeps' do

  before(:each) do
    Peep.create(:body => 'hello world',
                :created_at => Time.now)
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('hello world')
  end
end
