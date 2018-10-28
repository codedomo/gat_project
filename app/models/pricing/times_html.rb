class Pricing::TimesHtml < Pricing::DefaultPricing
  URL = 'http://time.com'.freeze

  def self.estimate
    number_of_nodes / 100
  end

  private

  def self.content
    @content ||= Nokogiri::HTML(open(URL))
  end

  def self.number_of_nodes
    counter = 0
    content.traverse do |node|
      counter += 1
    end
    counter
  end
end
