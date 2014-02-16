require 'spec_helper'

feature 'Maker posts a peep' do

  scenario 'when on the homepage' do
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep('Hello World!')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.body).to eq('Hello World!')
  end
end

def post_peep(body)
  within('#new_peep') do
    fill_in 'body', :with => body
    click_button 'Peep it!'
  end
end
