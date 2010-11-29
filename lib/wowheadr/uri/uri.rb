module Wowheadr
  module URI
    BASE_URL   = "http://www.wowhead.com/"
    JAVASCRIPT = "http://static.wowhead.com/widgets/power.js"

    # Return a URL for an entity on the wowhead.com site.
    # For example, self.url(:item, 43659) generates
    # http://www.wowhead.com/item=43659.
    #
    # To generate a URL for a different subdomain, pass the subdomain
    # (such as "ptr") as the optional third parameter.
    def self.url(entity, id, subdomain = nil)
      base_url = subdomain.nil? ? BASE_URL : BASE_URL.gsub("www", subdomain.to_s)
      "#{base_url}#{entity.to_s}=#{id.to_s}"
    end

    # Shortcut for self.url(:item, ...)
    def self.item(id, subdomain = nil)
      url(:item, id, subdomain)
    end

    # Shortcut for self.url(:achievement, ...)
    def self.achievement(id, subdomain = nil)
      url(:achievement, id, subdomain)
    end

    # Shortcut for self.url(:spell, ...)
    def self.spell(id, subdomain = nil)
      url(:spell, id, subdomain)
    end
  end
end
