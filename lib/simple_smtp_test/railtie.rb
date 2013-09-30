require 'simple_smtp_test'
require 'rails'
module SimpleSMTPTest
  class Railtie < Rails::Railtie
    railtie_name :simple_smtp_test

    rake_tasks do
      load "tasks/simple_smtp_test.rake"
    end
  end
end