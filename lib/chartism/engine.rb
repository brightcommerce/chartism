require 'chartism/helper'

module Chartism
  class Engine < ::Rails::Engine
    isolate_namespace Chartism

    initializer 'register_charts' do
      Dir[Rails.root.join('app','charts', '*.rb')].each { |f| require f }
    end

    initializer 'helper' do
      ActiveSupport.on_load(:action_view) do
        include Helper
      end
    end
  end
end
