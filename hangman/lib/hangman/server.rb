require 'drb'
require 'hangman/player_profile'


class Thread
  #
  # Wraps a block in Thread.critical, restoring the original value upon exit
  # from the critical section.
  #
  def Thread.exclusive
    _old = Thread.critical
    begin
      Thread.critical = true
      return yield
    ensure
      Thread.critical = _old
    end
  end
end


module Hangman

  class Server

    #TODO Need a timeout on the connection
    class << self

      def api
        if @api.nil?
          DRb.start_service
          @api = DRbObject.new(nil, 'druby://micahmartin.com:9697')
        end
        return @api
      end

      def profile(name)
        try do
          profile_hash = api.profile(name)
          return nil if profile_hash.nil?
          return PlayerProfile.new(profile_hash)
        end
      end

      def register_profile(profile)
        try do
          api.submit_profile(profile.simple_hash)
        end
      end

      def submit_score(profile, name, score, description)
        try do
          api.submit_score(:player_name => profile.name, :name => name, :score => score, :description => description)
        end
      end

      def submit_play(play)
        try do
          api.submit_play(:player => play[:name].untaint, :games => play[:games], :wins => play[:wins], :time_used => play[:time])
        end
      end

      private #############################################

      def try
        return if !$USE_SERVER
        begin
          yield
        rescue Exception => e
          puts e
          puts e.backtrace
          raise Exception.new(e.message)
        end
      end

    end

  end

end