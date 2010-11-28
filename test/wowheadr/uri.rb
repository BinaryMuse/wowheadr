require 'test/unit'
require 'wowheadr/uri'

class URITest < Test::Unit::TestCase
  def test_js_url
    assert_equal Wowheadr::URI::JAVASCRIPT, "http://static.wowhead.com/widgets/power.js"
  end

  def test_item_url
    assert_equal Wowheadr::URI.item(12345), "http://www.wowhead.com/item=12345"
  end

  def test_item_url_subdomain
    assert_equal Wowheadr::URI.item(12345, 'ptr'), "http://ptr.wowhead.com/item=12345"
  end

  def test_achievement_url
    assert_equal Wowheadr::URI.achievement(12345), "http://www.wowhead.com/achievement=12345"
  end

  def test_achievement_url_subdomain
    assert_equal Wowheadr::URI.achievement(12345, 'ptr'), "http://ptr.wowhead.com/achievement=12345"
  end

  def test_spell_url
    assert_equal Wowheadr::URI.spell(12345), "http://www.wowhead.com/spell=12345"
  end

  def test_spell_url_subdomain
    assert_equal Wowheadr::URI.spell(12345, 'ptr'), "http://ptr.wowhead.com/spell=12345"
  end

  def test_manual_url
    assert_equal Wowheadr::URI.url(:npc, 48935), "http://www.wowhead.com/npc=48935"
  end

  def test_manual_url_subdomain
    assert_equal Wowheadr::URI.url(:npc, 48935, 'ptr'), "http://ptr.wowhead.com/npc=48935"
  end
end
