require_relative 'item/quality'
require_relative 'item/generic_item'
require_relative 'item/aged_brie'
require_relative 'item/backstage_pass'
require_relative 'item/conjured_mana'
require_relative 'item/normal_item'
require_relative 'item/sulfuras'
require_relative 'item/type'

class GildedRose
  class Item
    NoKlassError = Class.new(StandardError)

    def self.create name, days_remaining, quality
      @item = new name, days_remaining, quality
      @item.klass.from_item name, days_remaining, quality
    end

    def initialize name, days_remaining, quality
      @name = name
      @days_remaining = days_remaining
      @quality = quality
    end

    def klass
      Type.all.each do |type|
        return type.klass if type.match? @name
      end
      raise NoKlassError, "#{@name} is not associated to a valid Class!"
    end

  end
end