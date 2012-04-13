require 'spec_helper'

describe 'Category Spec' do
  describe 'Factory Girl' do
    it 'should user factory valid' do
      FactoryGirl.create(:category).should be_valid
      FactoryGirl.build(:category).should be_valid
    end
    it 'should multiple user factory valid' do
      FactoryGirl.create(:category).should be_valid
      FactoryGirl.create(:category).should be_valid
    end
  end
  
end


