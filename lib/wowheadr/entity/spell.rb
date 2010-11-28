require 'wowheadr/uri/rel'

module Wowheadr
  module Entity
    # Wowheadr::Entity::Spell represents a +rel+ entry in an HTML link tag to
    # specify details about the spell being linked to. A list of key/value
    # combinations can be found at
    # http://www.wowhead.com/tooltips#related-advanced-usage
    class Spell
      include Wowheadr::URI::Rel

      # Create a new Spell and optionally pass in the ID,
      # which automatically calls #spell on the new object.
      def initialize(id = nil)
        super()
        unless id.nil?
          self.spell(id)
        end
        self
      end

      # Set the item ID for the spell. Useful if the +href+ attribute of the
      # link does not lead to the spell's URL on wowhead.com (custom URLs).
      def spell(id)
        self.set(:spell, id)
      end

      # Set the character's level, useful for spell scaling.
      def level(level)
        self.set(:lvl, level)
      end
      alias :lvl :level

      # Whether or not to show the tooltip for the buff the spell provides,
      # rather than for the spell itself.
      def buff(buff)
        self.set(:buff, buff)
      end
    end
  end
end
