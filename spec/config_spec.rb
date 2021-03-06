require 'spec_helper'

describe HotReloadProxy::Config do
  after(:each) { described_class.reset! }

  it 'has default host' do
    expect(described_class::DEFAULT_HOST).to eq('localhost')
  end

  it 'has default port' do
    expect(described_class::DEFAULT_PORT).to eq('3100')
  end

  it 'has #host accessor' do
    host = 'watman'
    described_class.host = host
    expect(described_class.host).to eq(host)
  end

  it 'has #port accessor and calls #to_s on the argument' do
    port = 4000
    described_class.port = port
    expect(described_class.port).to eq('4000')
  end
end
