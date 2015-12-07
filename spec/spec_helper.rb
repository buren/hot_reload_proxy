$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV.fetch('COVERAGE', false)
  require 'simplecov'
  SimpleCov.start
end

require 'hot_reload_proxy'
