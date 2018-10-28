class Pricing::DefaultPricing
  require 'nokogiri'
  require 'open-uri'

  include Pricing::Price

  DEFAULT_PRICE = 10.freeze


  def self.estimate
    DEFAULT_PRICE
  end
end
