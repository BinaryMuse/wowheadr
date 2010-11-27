module Wowheadr
  module URI
    BASE_URL   = "http://www.wowhead.com/"
    JAVASCRIPT = "http://static.wowhead.com/widgets/power.js"

    def self.item(id)
      "#{BASE_URL}item=#{id}"
    end

    def self.achievement(id)
      "#{BASE_URL}achievement=#{id}"
    end

    def self.spell(id)
      "#{BASE_URL}spell=#{id}"
    end
  end
end
