require 'hot_reload_proxy/version'
require 'hot_reload_proxy/proxy'
require 'hot_reload_proxy/railtie' if defined?(Rails)

module HotReloadProxy
  DEFAULT_HOST = 'localhost'
  DEFAULT_PORT = '3100'

  @host = DEFAULT_HOST
  @port = DEFAULT_PORT

  def self.host=(host)
    @host = host
  end

  def self.port=(port)
    @port = port.to_s
  end

  def self.host
    @host
  end

  def self.port
    @port
  end

  def self.reset!
    @host = DEFAULT_HOST
    @port = DEFAULT_PORT
  end
end
