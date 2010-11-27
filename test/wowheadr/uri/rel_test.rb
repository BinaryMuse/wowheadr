require 'test/unit'
require 'wowheadr/uri/rel'

# Set up a fake entity to include our Wowhead::Rel module in.
class FakeEntity
  include Wowheadr::URI::Rel
end

class RelTest < Test::Unit::TestCase
  def setup
    @rel = FakeEntity.new
  end

  def test_no_entries
    assert_nil @rel.to_s
  end

  def test_set
    @rel.send(:set, :lvl, 10)
    assert_equal "lvl=10", @rel.to_s
  end

  def test_multiple_set
    @rel.send(:set, :lvl, 10)
    @rel.send(:set, :color, "red")
    assert_equal "lvl=10&amp;color=red", @rel.to_s
  end

  def test_overwrite_set
    @rel.send(:set, :lvl, 10)
    @rel.send(:set, :lvl, 20)
    assert_equal "lvl=20", @rel.to_s
  end

  def test_add
    @rel.send(:add, :socket, "a")
    @rel.send(:add, :socket, "b")
    assert_equal "socket=a:b", @rel.to_s
  end

  def test_multiple_add
    @rel.send(:add, :socket, ["a", "b", "c"])
    assert_equal "socket=a:b:c", @rel.to_s
  end

  def test_set_add
    @rel.send(:set, :lvl, 20)
    @rel.send(:add, :gem, "first")
    @rel.send(:set, :color, "blue")
    @rel.send(:add, :gem, "second")
    assert_equal "lvl=20&amp;gem=first:second&amp;color=blue", @rel.to_s
  end

  def test_set_bool
    @rel.send(:set, :socket, true)
    assert_equal "socket", @rel.to_s
  end

  def test_domain
    @rel.domain('ptr')
    assert_equal "domain=ptr", @rel.to_s
  end
end