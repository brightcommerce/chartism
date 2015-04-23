module Chartism
  class ChartsController < ActionController::Base
    def show
      klass = Chartism.chartism params[:id]
      return render status: 404 unless klass

      chart = klass.new
      render json: {
        type: Chartism.chart_type(klass),
        options: chart.options,
        data: chart.data
      }
    end
  end
end
