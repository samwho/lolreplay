require File.dirname(__FILE__) + '/hash_method_accessor'
require 'json'

module LolReplay
  class Game
    include ::HashMethodAccessor
    attr_accessor :json, :path, :players

    # Constructor takes a path to a .lrf file. The file path that it is given
    # is read and the meta data is extracted for later use.
    def initialize path
      @path = path

      @data = File.open(path) do |f|
        f.read(4) # skip first four bytes
        size = f.read(4).unpack("L").first
        JSON.parse f.read(size), symbolize_names: true
      end

      @players = @data[:players].map { |p| Player.new p }
    end

    # Gets a player by name. If the player was not present in this game, nil
    # is returned.
    #
    # Example:
    #
    #   puts game.player "Samwho"
    #   #=> #<LolReplay::Player:0x8317074>
    def player name
      @players.each do |player|
        return player if player.name == name
      end

      nil
    end
  end
end
