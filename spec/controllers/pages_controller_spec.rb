require 'spec_helper'

describe PagesController do
	render_views

	pages = {"home" => "Home", "contact" => "Contact", "about" => "About"}

	pages.each_pair do |key,val|
		describe "GET '#{key}'" do
			it "should be successful" do
				get "#{key}"
				response.should be_success
			end

			it "should have the right title" do
				get "#{key}"
				response.should have_selector("title",
					  :content => "Ruby on Rails Tutorial Sample App | #{val}")
			end
		end
	end
end
