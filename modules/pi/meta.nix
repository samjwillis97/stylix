{ lib, ... }:
{
  name = "pi";
  homepage = "https://github.com/earendil-works/pi";
  maintainers = [ lib.maintainers.samjwillis97 ];
  description = ''
    Themes the [pi](https://github.com/earendil-works/pi) coding agent TUI.

    This module writes a `stylix` theme to `~/.pi/agent/themes/stylix.json` but
    does not activate it, since pi's theme is selected through `theme` in
    `~/.pi/agent/settings.json`, a file that also holds other user-managed
    settings. After enabling this module, activate the theme with `/settings`
    inside pi, or by setting `"theme": "stylix"` in your pi `settings.json`.
  '';
}
