require 'zlib'

module Hangman
  module Analyzers

    class SimplicityAnalyzer

      #      def self.analyze(profile)
      #        lines = count_lines(profile)
      #
      #        return 0, "No code found" if lines == 0
      #
      #        score = (score_for_lines(lines) + 0.5).to_i
      #
      #        return score, "#{score} : #{lines} LOC"
      #      end

      def self.analyze(profile)
        code = collect_code(profile)
puts "code.length: #{code.length}"

        return 0, "No code found" if code.empty?

        mass = count_mass(code)
puts "mass: #{mass}"        
        score = (score_for_mass(mass) + 0.5).to_i

        return score, "#{score} : #{mass} code mass"
      end

      def self.collect_code(profile)
        code = ""
        files = Dir.glob(File.join(profile.lib_dir, "**", "*.rb"))
        files.each { |file| code << IO.read(file) }
        return code
      end

      def self.count_mass(code)
        zipper = Zlib::Deflate.new
        data = zipper.deflate(code, Zlib::FINISH)
        return data.length
      end

      def self.score_for_mass(mass)
        score = 170.0 * (Math.log(2) / Math.log(mass/500.0 + 2.25))
        score = 100 if score > 100
        score = 0 if score < 0
        return score
      end

      def self.count_lines(profile)
        files = Dir.glob(File.join(profile.lib_dir, "**", "*.rb"))
        lines = 0
        files.each do |file|
          lines_str = `wc -l #{file}`
          lines += lines_str.to_i
        end
        return lines
      end

      def self.score_for_lines(lines)
        score = 150.0 * (Math.log(2) / Math.log(lines/100.0 + 1.8))
        score = 100 if score > 100
        return score
      end

    end

  end
end