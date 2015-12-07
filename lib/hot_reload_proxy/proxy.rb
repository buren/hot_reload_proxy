require 'rack-proxy'

module HotReloadProxy
  class Proxy < Rack::Proxy
    DEFAULT_HOST = 'localhost'
    DEFAULT_PORT = '3100'
    @foreign_host = DEFAULT_HOST
    @foreign_port = DEFAULT_PORT

    def self.foreign_host=(host)
      @foreign_host = host
    end

    def self.foreign_port=(port)
      @foreign_port = port.to_s
    end

    def self.foreign_host
      @foreign_host
    end

    def self.foreign_port
      @foreign_port
    end

    def self.reset!
      @foreign_host = DEFAULT_HOST
      @foreign_port = DEFAULT_PORT
    end

    WEBPACK_HOT_RELOAD_FILE_PATTERN = '.hot-update.'

    def initialize(app)
      @app = app
    end

    def call(env)
      # call super if we want to proxy
      (proxy?(env) && super) || @app.call(env)
    end

    def proxy?(env)
      Rack::Request.new(env).path.include?(WEBPACK_HOT_RELOAD_FILE_PATTERN)
    end

    def rewrite_env(env)
      port = self.class.foreign_port
      host = self.class.foreign_host
      env['HTTP_HOST'] = "#{host}:#{port}"
      env
    end
  end
end
