require 'securerandom'

module Chartism
  module Helper
    # Options include:
    #   - class
    def chart chartism, options={}
      data_json = chartism.data.to_json
      options_json = chartism.options.to_json
      id = "chartism-line-#{SecureRandom.hex(6)}"
      classes = ( ['ct-chart'] + Array(options[:class]) ).join(' ')

      %Q[
      <div class="#{classes}" id="#{id}"></div>
      <script>
      (function() {
        var data = #{data_json};
        var options = #{options_json};
        new Chartist.Line("##{id}", data, options);
      })();
      </script>
      ].html_safe
    end
  end
end
