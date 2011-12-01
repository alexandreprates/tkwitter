require 'rubygems'
require 'twitter'
require 'open-uri'
require 'tk'
require "tkextlib/tkimg/jpeg"
require "tkextlib/tkimg/png"

module Tkwitter
  require_relative 'tkwitter/image_fetcher'
  require_relative 'tkwitter/gui'
  require_relative 'tkwitter/searcher'
end