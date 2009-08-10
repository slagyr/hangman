module Hangman
  module Analyzers

    class TimeAnalyzer

      def self.analyze(profile)
        begin
          record = Server.profile(profile.name)
        rescue Exception => e
          puts e
          puts e.backtrace
          return 50, "50 : Couldn't retreive record"
        end
        return 50, "50 : No games recorded" if record.nil?

        games_played = record.games_played
        return 50, "50 : No games recorded" if games_played == 0

        seconds_per_game = record.time_used.to_f / games_played.to_f
        score = ((1.0 - seconds_per_game) * 100).to_i
        score = 0 if score < 0
        return score, "#{score} : #{seconds_per_game} sec/game"
      end

    end

  end
end