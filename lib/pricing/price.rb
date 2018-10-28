module Pricing::Price

  DEFAULT_CLASS = 'Pricing::DefaultPricing'
  PANEL_PROVIDERS_CLASSES = {
    'times_a'    => 'Pricing::TimesA',
    '10_arrays'  => 'Pricing::TenArrays',
    'times_html' => 'Pricing::TimesHtml'
  }.freeze

  def self.for(name)
    (PANEL_PROVIDERS_CLASSES[name] || DEFAULT_CLASS).constantize.estimate
  end

end
