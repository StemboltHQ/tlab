module Tlab
  class Engine < ::Rails::Engine
    isolate_namespace Tlab

    config.generators do |g|
      g.orm                 :active_record
      g.template_engine     :erb
      g.test_framework      :rspec
    end
  end
end
