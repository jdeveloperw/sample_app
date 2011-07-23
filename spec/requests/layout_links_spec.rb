require 'spec_helper'

describe "LayoutLinks" do
	pages = {"/" => "Home", "/contact" => "Contact", "/about" => "About", "/help" => "Help", "/signup" => "Sign up"}

	pages.each_pair do |key,val|
		it "should have a #{val} page at '#{key}'" do
			get key
			response.should have_selector('title', :content => val)
		end

		it "should have the right links on the layout" do
			visit root_path
			click_link val
			response.should have_selector('title', :content => val)
		end
	end
end
