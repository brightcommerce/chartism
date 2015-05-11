require 'docile'
require "chartism/version"
require 'chartism/options'
require 'chartism/line'
require 'chartism/pie'
require 'chartism/line/options'
require 'chartism/pie/options'
require "chartism/engine" if defined?(Rails)

module Chartism
  def self.line_chart name, &block
    self.register name, Docile.dsl_eval(Line.new, &block)
  end

  def self.pie_chart name, &block
    self.register name, Docile.dsl_eval(Pie.new, &block)
  end

  def self.register name, chartism
    @charts ||= {}
    @charts[name.to_s] = chartism
  end

  def self.chartism name
    @charts[name.to_s]
  end

  def self.chart_type chartism
    case chartism
      when Chartism::Line
        'Line'
      when Chartism::Pie
        'Pie'
      else
        fail 'Unknown chart'
    end
  end
end

