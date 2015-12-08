require 'rack-proxy'

module HotReloadProxy
  class Proxy < Rack::Proxy
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
      port = HotReloadProxy.port
      host = HotReloadProxy.host
      env['HTTP_HOST'] = "#{host}:#{port}"
      env
    end
  end
end
