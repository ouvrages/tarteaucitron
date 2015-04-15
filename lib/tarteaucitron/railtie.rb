require 'tarteaucitron/view_helpers'
module Tarteaucitron
  class Railtie < Rails::Railtie
    initializer "tarteaucitron.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
