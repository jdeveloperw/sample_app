require 'spec_helper'

describe PagesController do
	render_views

	pages = {"home" => "Home", "contact" => "Contact", "about" => "About", "help" => "Help"}

	before(:each) do
		@base_title = "Ruby on Rails Tutorial Sample App"
	end

	pages.each_pair do |key,val|
		describe "GET '#{key}'" do
			it "should be successful" do
				get "#{key}"
				response.should be_success
			end

			it "should have the right title" do
				get "#{key}"
				response.should have_selector("title",
					  :content => @base_title + " | #{val}")
			end
		end
	end
end
