module Hangman
  module Analyzers

    class CoverageAnalyzer

      CoverageRegexp = /(\d+(.\d)?)%/

      def self.analyze(profile)
        results = `cd #{profile.root_path} && rake -f Hangman.Rakefile spec_with_rcov`
        return 0, "Failures!" if !results.include?("0 failures")
        lines = results.split(/^/)
        last = lines[-1]
        match = CoverageRegexp.match(last)
        return 0, "Errors checking coverage." if match.nil?

        coverage_percentage = match[1].to_f
        miss = 100 - coverage_percentage
        score = (100 - (miss * 5)).to_i
        score = 0 if score < 0
        return score, "#{score} : #{coverage_percentage}% test coverage"
      end

    end

  end
end