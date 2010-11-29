require 'test/unit'
require 'wowheadr/entity/item'

class ItemTest < Test::Unit::TestCase
  def setup
    @item = Wowheadr::Entity::Item.new
  end

  def test_no_object
    item = Wowheadr::Entity::Item.lvl(10).ench(501)
    assert_equal "lvl=10&amp;ench=501", item.to_s
  end

  def test_item
    @item.item(12345)
    assert_equal "item=12345", @item.to_s
  end

  def test_id
    @item.id(12345)
    assert_equal "item=12345", @item.to_s
  end

  def test_new_item
    item = Wowheadr::Entity::Item.new(12345).level(10)
    assert_equal "item=12345&amp;lvl=10", item.to_s
  end

  def test_level
    @item.level(10)
    assert_equal "lvl=10", @item.to_s
  end

  def test_lvl
    @item.lvl(10)
    assert_equal "lvl=10", @item.to_s
  end

  def test_enchant
    @item.enchantment(501)
    assert_equal "ench=501", @item.to_s
  end

  def test_ench
    @item.ench(501)
    assert_equal "ench=501", @item.to_s
  end

  def test_gems
    @item.gems(101)
    assert_equal "gems=101", @item.to_s
  end

  def test_multiple_gems
    @item.gems(101, 201, 301)
    assert_equal "gems=101:201:301", @item.to_s
  end

  def test_multiple_gems_array
    @item.gems([101, 201, 301])
    assert_equal "gems=101:201:301", @item.to_s
  end

  def test_gems_string
    @item.gems('101:201:301')
    assert_equal "gems=101:201:301", @item.to_s
  end

  def test_pieces
    @item.pieces(101)
    assert_equal "pcs=101", @item.to_s
  end

  def test_multiple_pieces
    @item.pieces(101, 201, 301)
    assert_equal "pcs=101:201:301", @item.to_s
  end

  def test_multiple_pieces_array
    @item.pieces([101, 201, 301])
    assert_equal "pcs=101:201:301", @item.to_s
  end

  def test_pieces_string
    @item.pieces('101:201:301')
    assert_equal "pcs=101:201:301", @item.to_s
  end

  def test_random_enchantment
    @item.random_enchantment('103')
    assert_equal "rand=103", @item.to_s
  end

  def test_socket
    @item.socket(true)
    assert_equal "sock", @item.to_s
  end

  def test_chaining
    @item.level(10).enchant(501).gems(101, 201).socket(true)
    assert_equal "lvl=10&amp;ench=501&amp;gems=101:201&amp;sock", @item.to_s
  end
end