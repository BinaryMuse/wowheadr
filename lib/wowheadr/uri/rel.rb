module Wowheadr
  module URI
    # Wowheadr::URI::Rel defines methods for creating the +rel+ portion of a
    # link using the Powered by Wowhead API. For a list of supported
    # attributes, see http://www.wowhead.com/tooltips#related-advanced-usage
    #
    # Once the key/value combinations for the wowhead.com entity have been
    # set, you can retrieve the text for the +rel+ portion of an HTML link
    # tag by calling +to_s+ on the object.
    #
    # The methods to modify the data inside a Rel is protected, and a Rel
    # object can not be instantiated--instead, subclasses of Rel (which
    # represent specific Wowhead entries with known rel attributes) should
    # be created and used instead.
    module Rel
      # Set the wowhead domain (www, ptr, de, es, fr, ru)
      # to display a different version or localization.
      def domain(domain)
        self.set(:domain, domain)
      end

      # Return the complete "rel" portion of the URL.
      def to_s
        return nil if @data.empty?

        @data.collect do |key, value|
          # Array values are concatenated by colons
          if value.is_a? Array
            "#{key}=#{value.join(':')}"
          # Boolean values don't have a right-side assignment
          elsif value.class == TrueClass || value.class == FalseClass
            key
          # All other values get the standard behavior
          else
            "#{key}=#{value.to_s}"
          end
        end.join "&amp;"
      end

      protected

        # Protected self.new to keep from being instantiated
        def self.new
        end

        def initialize
          @instance = nil
          @data     = {}
        end

        # Set the given key to a single value.
        def set(key, value)
          @data[key.to_s] = value
          self
        end

        # Add a value or an array of values to the given key.
        def add(key, value)
          @data[key.to_s] ||= []
          @data[key.to_s] << value
          self
        end
    end
  end
end
