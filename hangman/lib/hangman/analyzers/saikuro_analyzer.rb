#ruby "/opt/local/lib/ruby/gems/1.8/gems/jscruggs-metric_fu-0.8.0/lib/metric_fu/saikuro/saikuro.rb" --warn_cyclo 5 --error_cyclo 7 --output_directory /tmp/metric_fu/saikuro --input_directory "lib" --filter_cyclo 0 --cyclo
require 'tmpdir'

module Hangman
  module Analyzers

    class SaikuroAnalyzer

      FAULT_REGEXP = /<td class="(warning|error)">(\d+)<\/td>/
      RESULT_REGEXP = /<tr><td>.*<\/td><td>(\d+)<\/td><td>\d+<\/td><\/tr>/
      MAX_COMPLEXITY = 2
      OUTDIR = Dir.tmpdir

      SaikuroMain = File.expand_path(File.dirname(__FILE__) + "/saikuro.rb")

      def self.analyze(profile)
        begin
          outdir = File.join(OUTDIR, rand.to_s)
          saikuro_options = "--warn_cyclo 5 --error_cyclo 7 --output_directory \"#{outdir}\" --filter_cyclo 0 --cyclo "
          return 0, "0 : lib not found" if profile.lib_dir.nil?
          command = "ruby \"#{SaikuroMain}\" #{saikuro_options} --input_directory \"#{profile.lib_dir}\""
          system command

          html_files = Dir.glob(File.join(outdir, "**", "*.html"))
          output = ""
          html_files.each { |file| output << IO.read(file) }

          fault_total, excess_total = count_faults(output)

          score = 100 - fault_total
          score = 0 if score < 0
          return score, "#{score} : #{excess_total.to_s} pts excessive complexity"
        rescue StandardError => e
          puts e
          puts e.backtrace
          return 0, e.to_s
        end
      end

      def self.count_faults(output)
        fault_total = 0
        excess_total = 0
        while match = output.match(RESULT_REGEXP)
          fault_str = match[1]

          fault = fault_str.to_i - MAX_COMPLEXITY
          fault = 0 if fault < 0
          excess_total += fault
          if fault == 1
            fault_total += 1
          elsif fault == 2
            fault_total += 5
          elsif fault == 3
            fault_total += 10
          elsif fault != 0
            fault_toal += 30
          end

          output = match.post_match
        end
        return fault_total, excess_total
      end


    end

  end
end