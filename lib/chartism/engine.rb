require 'chartism/helper'

module Chartism
  class Engine < ::Rails::Engine
    isolate_namespace Chartism
    engine_name 'chartism'

    initializer 'helper' do
      ActiveSupport.on_load(:action_view) do
        include Helper
      end
    end
  end
end
