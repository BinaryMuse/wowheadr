wowheadr: a Powered by Wowhead Library for Ruby
===============================================

`wowheadr` (pronounced "wow header") is a Ruby gem designed to help leverage the power the [Powered by Wowhead JavaScript API][powered]. It can help generate links to items, achievements, spells, and other entities in the Wowhead database.

  [powered]: http://www.wowhead.com/tooltips

Generating URLs
---------------

You can generate URLs for (currently) items, achievements, and spells, providing you know the ID for the entity you want a URL for. Use the methods in `Wowheadr::URI` to generate the URLs. For example, to generate a URL for the item "Bloodied Prison Shank" (http://www.wowhead.com/item=43659), you would use:

    gift = Wowheadr::URI.item(43659)

And, to generate a URL for the ability "Bear Form" (http://www.wowhead.com/spell=5487), you would use:

    sum_durids = Wowheadr::URI.spell(5487)

Advanced Usage
--------------

Wowhead provides the ability to customize links to various entities on their site using the `rel` property of the HTML link tag. Wowheadr supports this via the `Wowheadr::Entity` classes. (Currently, only `Item` and `Spell` are available.)

### Items

For example, to get the `rel` attribute for a link to a "Bloodied Arcanite Reaper" (http://www.wowhead.com/item=42943) tuned for a level 25 character, you can use:

    zinwrath = Wowheadr::Entity::Item.id(42943).level(25).to_s

(Calling `to_s` on any `Entity` class returns the text that should be placed in the `rel` attribute of your link, as shown:)

    <a hef="http://www.warcraftmovies.com/movieview.php?id=7558" rel="item=42943&amp;lvl=25">Arcanite Reaper, HOOOOO</a>

You can add enchants, gems, sockets, other set pieces, and more to an `Item`:

    Wowheadr::Entity::Item.id(25697).gems(23121).enchant(2647).pieces(25695, 25696, 25697)

### Spells

Spells work similarly. You can change the level using the `level()` method (for spell scaling), and you can use the `buff()` method to cause the tooltip to show the buff or debuff the spell causes rather than the spell itself.

    man_angle     = Wowheadr::Entity::Spell.new(33878).level(10).to_s
    level_ten_rel = man_angle.level(10).to_s
    debuff_rel    = man_angle.buff(true).to_s

More Awesomeness
----------------

More is planned in the immediate future, including a Ruby on Rails gem that provides various helper methods to make integrating Powered by Wowhead even easier. Stay tuned!
