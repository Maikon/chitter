require 'spec_helper'

describe Peep do

  context 'Testing datamapper' do

    it 'should be created and then retrieved from the database' do
      expect(Peep.count).to eq(0)
      Peep.create(:body => 'Wawaweewa this is sweet magic!')
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.body).to eq('Wawaweewa this is sweet magic!')
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end
