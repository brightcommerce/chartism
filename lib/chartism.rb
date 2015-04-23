require "chartism/version"
require "chartism/engine" if defined?(Rails)
require 'chartism/options'
require 'chartism/line/options'
require 'chartism/pie/options'
require 'chartism/chart'
require 'chartism/line'
require 'chartism/pie'

module Chartism
  def self.register chartism
    @charts ||= {}
    @charts[chartism.to_s] = chartism
  end

  def self.chartism id
    @charts[id.to_s]
  end

  def self.chart_type chartism
      return 'Line' if chartism.include? Chartism::Line
      return 'Pie' if chartism.include? Chartism::Pie
      fail 'unknown Chartism'
  end
end
