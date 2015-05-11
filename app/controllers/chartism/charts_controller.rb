module Chartism
  class ChartsController < ActionController::Base
    def show
      chart = Chartism.chartism params[:id]
      raise ActionController::RoutingError.new('Not Found') unless chart

      render json: {
        type: Chartism.chart_type(chart),
        options: chart.options,
        data: chart.data
      }
    end
  end
end
