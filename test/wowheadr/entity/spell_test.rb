require 'test/unit'
require 'wowheadr/entity/spell'

class SpellTest < Test::Unit::TestCase
  def setup
    @spell = Wowheadr::Entity::Spell.new
  end

  def test_no_object
    spell = Wowheadr::Entity::Spell.id(51234).lvl(10)
    assert_equal "spell=51234&amp;lvl=10", spell.to_s
  end

  def test_spell
    @spell.spell(33878)
    assert_equal "spell=33878", @spell.to_s
  end

  def test_id
    @spell.id(33878)
    assert_equal "spell=33878", @spell.to_s
  end

  def test_new_spell
    spell = Wowheadr::Entity::Spell.new(33878).level(10)
    assert_equal "spell=33878&amp;lvl=10", spell.to_s
  end

  def test_level
    @spell.level(10)
    assert_equal "lvl=10", @spell.to_s
  end

  def test_lvl
    @spell.lvl(10)
    assert_equal "lvl=10", @spell.to_s
  end

  def test_buff
    @spell.buff(true)
    assert_equal "buff", @spell.to_s
  end

  def test_chaining
    @spell.level(10).buff(true)
    assert_equal "lvl=10&amp;buff", @spell.to_s
  end
end
