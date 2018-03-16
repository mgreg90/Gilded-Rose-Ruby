class GildedRose
  class Item
    class Type

      attr_reader :klass, :matcher

      def self.all
        @@all ||= [
          new(NormalItem),
          new(AgedBrie),
          new(Sulfuras),
          new(BackstagePass),
          new(ConjuredMana)
        ]
      end

      def initialize klass, matcher=nil
        @klass = klass
        @matcher = matcher || (klass::MATCHER if defined?(klass::MATCHER))
      end

      def match? name
        case matcher
        when String then !!(name == matcher)
        when Regexp then !!(name =~ matcher)
        end
      end

    end
  end
end