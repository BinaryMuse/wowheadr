module Wowheadr
  module Support
    # EntityMethodMapper allows chaining of the Entity classes' methods
    # without having to declare a new instance first. For example, without
    # including this module, the following would be required:
    #
    # <tt>Wowheadr::Entity::Item.new.id(12345).level(10)</tt>
    #
    # or
    #
    # <tt>Wowheadr::Entity::Item.new(12345).level(10)</tt>
    #
    # After including this module, the following ca be used instead:
    #
    # <tt>Wowheadr::Entity::Item.id(12345).level(10)</tt>
    module EntityMethodMapper
      def self.included(base)
        base.extend ClassMethods
      end

      # The class methods that Wowheadr::Support::EntityMethodMapper
      # adds to the including class.
      module ClassMethods
        # If a class method is missing, attempt to call it as an instance
        # method on a new instance of the class.
        def method_missing(method_sym, *args, &block)
          self.new.send(method_sym, *args, &block)
        end
      end
    end
  end
end
