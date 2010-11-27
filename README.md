wowheadr: a Powered by Wowhead Library for Ruby
===============================================

`wowheadr` (pronounced "wow header") is a Ruby gem designed to help leverage the power the [Powered by Wowhead JavaScript API][powered]. It can help generate links to items, achievements, spells, and other entities in the Wowhead database.

  [powered]: http://www.wowhead.com/tooltips

Generating URLs
---------------

You can generate URLs for (currently) items, achievements, and spells, providing you know the ID for the entity you want a URL for. Use the methods in `Wowheadr::URI` to generate the URLs. For example, to generate a URL for the item "Bloodied Prison Shank" (http://www.wowhead.com/item=43659), you would use:

    Wowheadr::URI.item(43659)

And, to generate a URL for the ability "Path of Frost" (http://www.wowhead.com/spell=3714), you would use:

    Wowheadr::URI.spell(3714)

Advanced Usage
--------------

Wowhead provides the ability to customize links to various entities on their site using the `rel` property of the HTML link tag. Wowheadr supports this via the `Wowheadr::Entity` classes. (Currently, only `Item` is available.)

For example, to get the `rel` attribute for a link to a "Bloodied Arcanite Reaper" (http://www.wowhead.com/item=42943) tuned for a level 25 character, you can use:

    Wowheadr::Entity::Item.new(42943).level(25).to_s

(Calling `to_s` on any `Entity` class returns the text that should be placed in the `rel` attribute of your link, as shown:)

    <a hef="http://non-wowhead-site.com" rel="item=42943&amp;lvl=25">Got an awesome new item for my character</a>

You can add enchants, gems, sockets, other set pieces, and more to an `Entity`:

    Wowheadr::Entity::Item.new(25697).gems(23121).enchant(2647).pieces(25695, 25696, 25697)

More Awesomeness
----------------

More is planned in the immediate future, including a Ruby on Rails gem that provides various helper methods to make integrating Powered by Wowhead even easier. Stay tuned!
