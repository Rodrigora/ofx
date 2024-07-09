module OFX
  class Configuration
    attr_accessor :default_timezone

    def initialize
      reset
    end

    def reset
      @default_timezone = "+0000"
    end
  end
end
