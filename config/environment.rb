# Load the Rails application.
require_relative 'application'
ActionMailer::Base.default :content_type => "text/html"
# Initialize the Rails application.
Rails.application.initialize!
ENV['AMDIN'] = "kumargsowmya@gmail.com"
