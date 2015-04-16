require 'tarteaucitron/view_helpers'
require 'geoip'
module Tarteaucitron
  class Railtie < Rails::Railtie
    initializer "tarteaucitron.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
