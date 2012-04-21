require 'spec_helper'

describe TipsController do
  describe 'access the tip index' do
    it 'should retrieve the list of all tips' do
      Tip.should_receive(:tips_by_categories)
      get :index
    end
  end
end
