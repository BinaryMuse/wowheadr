require 'wowheadr/uri/rel'

module Wowheadr
  module Entity
    # Wowheadr::Entity::Item represents a +rel+ entry in an HTML link tag to
    # specify details about the item being linked to. A list of key/value
    # combinations can be found at
    # http://www.wowhead.com/tooltips#related-advanced-usage
    class Item
      include Wowheadr::URI::Rel

      # Create a new Item and optionally pass in the ID,
      # which automatically calls #item on the new object.
      def initialize(id = nil)
        super()
        unless id.nil?
          self.item(id)
        end
        self
      end

      # Set the item ID for the item. Useful if the +href+ attribute of the
      # link does not lead to the item's URL on wowhead.com (custom URLs).
      def item(id)
        self.set(:item, id)
      end

      # Set the character's level, useful for heirloom items.
      def level(level)
        self.set(:lvl, level)
      end
      alias :lvl :level

      # Set the item's enchant using the enchant's ID.
      def enchantment(enchant_id)
        self.set(:ench, enchant_id)
      end
      alias :ench :enchantment
      alias :enchant :enchantment

      # Add the specified gems to the items gem slots using the gems' IDs.
      # gems can be a single gem ID, multiple gem IDs, an array of gem IDs,
      # or a colon-delimited string of gem IDs.
      def gems(*gems)
        if gems.is_a? String
          self.add(:gems, gems.split(':'))
        else
          self.add(:gems, gems)
        end
      end

      # Whether or not to add an extra gem socket to the item.
      def socket(socket)
        self.set(:sock, socket)
      end
      alias :extra_socket :socket
      alias :sock :socket

      def pieces(*pieces)
        if pieces.is_a? String
          self.add(:pcs, pieces.split(':'))
        else
          self.add(:pcs, pieces)
        end
      end
      alias :set_pieces :pieces
      alias :pcs :pieces

      def random_enchantment(enchant_id)
        self.set(:rand, enchant_id)
      end
      alias :rand :random_enchantment
      alias :rand_enchat :random_enchantment
    end
  end
end
