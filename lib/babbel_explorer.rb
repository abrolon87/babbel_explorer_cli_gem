# This is my environment
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

require_relative './babbel_explorer/version'
require_relative './babbel_explorer/cli'
require_relative './babbel_explorer/country'
require_relative './babbel_explorer/scraper'


module BabbelExplorer 
  class Error < StandardError; end
  # Your code goes here...
end 