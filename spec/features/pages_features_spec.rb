require 'rails_helper'

describe "pages features" do

  before(:each) do
    @base_title = 'Pages#'
  end

  it "right title" do
    visit '/'
    expect(page).to have_selector('h1', :text => @base_title + 'home')
  end

  it "right title" do
    visit '/contact'
    expect(page).to have_selector('h1', :text => @base_title + 'contact')
  end

end