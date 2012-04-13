require 'spec_helper'
require 'factory_girl_rails'

describe Tip do
  describe 'Factory Girl' do
    it 'should user factory valid' do
      Factory.create(:tip).should be_valid
      Factory.build(:tip).should be_valid
    end
    it 'should multiple user factory valid' do
      Factory.create(:tip).should be_valid
      Factory.create(:tip).should be_valid
    end
  end
end