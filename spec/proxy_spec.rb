require 'spec_helper'

describe HotReloadProxy::Proxy do
  it 'has default host' do
    expect(described_class::DEFAULT_HOST).to eq('localhost')
  end

  it 'has default port' do
    expect(described_class::DEFAULT_PORT).to eq('3100')
  end

  describe 'class' do
    after(:each) { described_class.reset! }

    it 'has #foreign_host accessor' do
      host = 'watman'
      described_class.foreign_host = host
      expect(described_class.foreign_host).to eq(host)
    end

    it 'has #foreign_port accessor and calls #to_s on the argument' do
      port = 4000
      described_class.foreign_port = port
      expect(described_class.foreign_port).to eq('4000')
    end
  end

  it 'has webpack hot reload file pattern' do
    constant = described_class::WEBPACK_HOT_RELOAD_FILE_PATTERN
    expect(constant).to eq('.hot-update.')
  end

  describe 'instance' do
    # Mock Rack::Request
    module Rack
      class Request
        TEST_WEBPACK_ROUTE = "http://localhost::/index#{HotReloadProxy::Proxy::WEBPACK_HOT_RELOAD_FILE_PATTERN}.js"

        def initialize(should_proxy)
          @should_proxy = should_proxy
        end

        def path
          @should_proxy ? TEST_WEBPACK_ROUTE : ''
        end
      end
    end

    # Overriding the Rack::Proxy#call (not very pretty..)
    module Rack
      class Proxy
        def call(enc)
          'rack proxy override'
        end
      end
    end

    describe '#rewrite_env' do
      it 'mutates HTTP_HOST' do
        proxy = described_class.new(nil)
        expect(proxy.rewrite_env({})).to eq('HTTP_HOST' => 'localhost:3100')
      end
    end

    # TODO: Mock Rack::Request.new(env).path
    describe '#proxy?' do
      it 'returns false when it should not proxy' do
        proxy = described_class.new(nil)
        expect(proxy.proxy?(false)).to eq(false)
      end

      it 'returns true when it should not proxy' do
        proxy = described_class.new(nil)
        expect(proxy.proxy?(true)).to eq(true)
      end
    end

    describe '#call' do
      it 'does not call super when it should not proxy' do
        app = ->(_arg) { 'app' }
        proxy = described_class.new(app)
        expect(proxy.call(false)).to eq('app')
      end

      it 'does call super when it should proxy' do
        proxy = described_class.new(nil)
        expect(proxy.call({})).to eq("rack proxy override")
      end
    end
  end
end
