require File.dirname(__FILE__) + '/hash_method_accessor'

module LolReplay
  class Player
    include ::HashMethodAccessor

    def initialize data
      @data = data
    end

    # Alias for summoner
    def name
      @data[:summoner]
    end

    # Alias for leaver
    def leaver?
      @data[:leaver]
    end

    # Alias for won
    def won?
      @data[:won]
    end

    def to_s

    end
  end
end
