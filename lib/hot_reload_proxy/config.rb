module HotReloadProxy
  class Config
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
end
