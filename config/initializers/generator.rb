Rails.application.config.generators do |g|
  g.test_framework :rspec, view_specs: false, fixture_replacement: :factory_girl
  g.stylesheets false
  g.javascripts false
  g.helper false
  g.fixture_replacement :factory_girl, :dir => 'spec/support/factories', :suffix => 'factory'
end