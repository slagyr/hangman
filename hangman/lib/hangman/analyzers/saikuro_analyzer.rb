#ruby "/opt/local/lib/ruby/gems/1.8/gems/jscruggs-metric_fu-0.8.0/lib/metric_fu/saikuro/saikuro.rb" --warn_cyclo 5 --error_cyclo 7 --output_directory /tmp/metric_fu/saikuro --input_directory "lib" --filter_cyclo 0 --cyclo
require 'tmpdir'

module Hangman
  module Analyzers

    class SaikuroAnalyzer

      FAULT_REGEXP = /<td class="(warning|error)">(\d+)<\/td>/
      TMPDIR = Dir.tmpdir

      SaikuroMain = File.expand_path(File.dirname(__FILE__) + "/saikuro.rb")
      SaikuroOptions = "--warn_cyclo 5 --error_cyclo 7 --output_directory \"#{TMPDIR}\" --filter_cyclo 0 --cyclo "

      def self.analyze(profile)
        return 0, "0 : lib not found" if profile.lib_dir.nil?
        command = "ruby \"#{SaikuroMain}\" #{SaikuroOptions} --input_directory \"#{profile.lib_dir}\""
        system command

        output_file = File.join(TMPDIR, "index_cyclo.html")
        output = IO.read( output_file)

        fault_total = 0
        while match = output.match(FAULT_REGEXP)
          fault_str = match[2]
          fault = fault_str.to_i - 4
          fault_total += fault
          output = match.post_match
        end

        score = 100 - fault_total
        score = 0 if score < 0
        return score, "#{score} : #{fault_total} pts excessive complexity"
      end

    end

  end
end