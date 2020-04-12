require 'sass'
require 'active_support/inflector'
require 'humanize'
require 'ordinalize'

module SassC
  module Script
    module Functions
      DENOMINATOR_WORD_EXCEPTIONS = { 1 => 'whole', 2 => 'half' }

      def numerator_word(numerator)
        numerator.humanize
      end

      def denominator_word(denominator)
        DENOMINATOR_WORD_EXCEPTIONS.fetch(denominator, denominator.ordinalise)
      end

      def reduce_fraction(numerator, denominator)
        gcd = numerator.gcd(denominator)
        numer_reduced = (numerator / gcd)
        denom_reduced = (denominator / gcd)
        { numerator: numer_reduced, denominator: denom_reduced }
      end

      # Human readable fractions
      def fraction_to_string(numerator, denominator)
        numer_word = numerator_word(numerator.value.to_i)
        denom_word = denominator_word(denominator.value.to_i)
        denom_word = denom_word.pluralize if numerator.value > 1
        classname_string = [numer_word, denom_word].join(' ').gsub(' ', '-')
        Sass::Script::String.new(classname_string)
      end

      def fraction_reduced_to_string(numerator, denominator)
        reduced = reduce_fraction(numerator.value.to_i, denominator.value.to_i)
        numer = Sass::Script::Number.new(reduced[:numerator])
        denom = Sass::Script::Number.new(reduced[:denominator])
        fraction_to_string(numer, denom)
      end
    end
  end
end
