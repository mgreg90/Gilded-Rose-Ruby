# To create a new item class, do the following: 
# 1) Create a class that inherits from GenericItem
# 2) Implement a #change_options method that returns a hash with an :action key
#    that points to one of Quality::ACTIONS and an :amount key that points to an
#    integer.
# 3) Implement a MATCHER constant in your class with a regex or string to map a
#    GildedRose name to your class.
# 4) Require your class here.
# 5) Add your class to Type.all in type.rb

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
      Type.each do |type|
        return type.klass if type.match? @name
      end
      raise NoKlassError, "#{@name} is not associated to a valid Class!"
    end

  end
end