require 'rails_helper'

RSpec.describe "LayoutLinks", type: :request, :type => :feature do
  describe "GET 'home'" do
    it "should work" do
      visit '/'
      expect(page).to have_selector('h1', :text => 'home')
    end
  end
end
