require 'sass'
require 'grid/systemic/sass_functions'
require "grid/systemic/version"

if defined?(::Rails)
  require 'sass-rails'
  require 'grid/systemic/engine'
end

module Grid
  module Systemic
  end
end
