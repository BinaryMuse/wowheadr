module Wowheadr
  module Support
    module EntityMethodMapper
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def method_missing(method_sym, *args, &block)
          self.new.send(method_sym, *args, &block)
        end
      end
    end
  end
end
