class Pricing::TenArrays < Pricing::DefaultPricing
  URL_WITH_PARAMS = 'http://openlibrary.org/search.json?q=the+lord+of+the+rings'.freeze

  def self.estimate
    number_of_arrays_in
  end

  private

  def self.content
    @content ||= JSON.parse(open(URL_WITH_PARAMS).read)
  end

  def self.number_of_arrays_in
    counter = 0
    counter += 1 if content['docs'].size > 10
    content['docs'].each do |e|
      e.each do |k, v|
        counter += 1 if v.is_a?(Array) && v.count > 10
      end
    end
    counter
  end
end
