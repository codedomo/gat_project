class Pricing::TimesA < Pricing::DefaultPricing
  URL = 'http://time.com'.freeze

  def self.estimate
    count_letter / 100
  end

  private

  def self.content
    @content ||= Nokogiri::HTML(open(URL))
  end

  def self.count_letter
    content.root.text.count('a')
  end
end
