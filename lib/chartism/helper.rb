require 'securerandom'

module Chartism
  module Helper
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
        new Chartist.#{chart_type(chartism)}("##{id}", data, options);
      })();
      </script>
      ].html_safe
    end

    private

    def chart_type chartism
      return 'Line' if chartism.class.include? Chartism::Line
      return 'Pie' if chartism.class.include? Chartism::Pie
      fail 'unknown Chartism'
    end
  end
end
