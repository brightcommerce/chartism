require 'securerandom'

module Chartism
  module Helper
    # Chartism should be an object
    # Options include:
    #   - id
    #   - class
    def chart chartism, options={}
      data_json = chartism.data.to_json
      options_json = chartism.options.to_json
      id = options.fetch :id, "chartism-#{SecureRandom.hex(6)}"
      classes = ( ['ct-chart'] + Array(options[:class]) ).join(' ')

      %Q[
      <div class="#{classes}" id="#{id}"></div>
      <script>
      (function() {
        var data = #{data_json};
        var options = #{options_json};
        new Chartist.#{Chartism.chart_type(chartism.class)}("##{id}", data, options);
      })();
      </script>
      ].html_safe
    end

    def remote_chart klass, options={}
      classes = ( ['ct-chart'] + Array(options[:class]) ).join(' ')
      id = options.fetch :id, "chartism-#{SecureRandom.hex(6)}"
      url = Chartism::Engine.routes.url_helpers.chart_path(klass.to_s)
      content_tag :div, '', id: id, class: classes, data: {'chartism-url' => url }
    end
  end
end
