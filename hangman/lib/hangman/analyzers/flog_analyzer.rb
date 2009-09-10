module Hangman
  module Analyzers

    class FlogAnalyzer

      ScoreRegex = /(\d+\.\d): .*/
      PassingScore = 9

      def self.analyze(profile)
        results = `flog -a #{profile.lib_dir}`

        valid_flog_result = results =~ /flog total/
        return 0, "Flog 2.2 not installed properly." if !valid_flog_result

        methods = 0
        passes = 0
        lines = results.split(/$/)
        lines.shift # total flog
        lines.shift # method average
        lines.each do |line|
          line.strip!
          match = ScoreRegex.match(line)
          if match
            methods += 1
            score = match[1].to_f
            passes += 1 if score < PassingScore
          end
        end
        return 0, "No methods found!" if methods == 0
        score = ((passes.to_f / methods.to_f) * 100.0 + 0.5).to_i
        return score, "#{score} : #{passes}/#{methods} methods pass"
      end

    end

  end
end