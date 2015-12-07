require 'rails/railtie'

module HotReloadProxy
  class HotReloadProxyRailtie < ::Rails::Railtie
    initializer "hot_reload_proxy_railtie.configure_rails_initialization" do |app|
      app.middleware.use HotReloadProxy::Proxy
    end
  end
end
