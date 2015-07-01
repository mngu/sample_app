require 'rails_helper'

describe "users features" do

  it "right title" do
    visit 'users/new'
    expect(page).to have_selector("h1", :text => "new")
  end

end