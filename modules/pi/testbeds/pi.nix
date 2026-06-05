# pi is not packaged in nixpkgs, so this testbed cannot build pi from a
# `pkgs` attribute yet. It is disabled to keep it out of the flake's testbed
# outputs (see `stylix/testbed/is-enabled.nix`), while documenting the intended
# setup. Once pi is available in nixpkgs, replace the `pkgs.pi` reference below,
# drop the `stylix.testbed.enable = false;` line, and the testbed will work.
{ lib, ... }:
{
  # pi is not yet in nixpkgs; keep this testbed out of the flake outputs.
  stylix.testbed.enable = false;

  stylix.testbed.ui.command = {
    # text = lib.getExe pkgs.pi;
    text = "pi";
    useTerminal = true;
  };

  home-manager.sharedModules = lib.singleton {
    # The pi module writes ~/.pi/agent/themes/stylix.json. pi loads it on start;
    # select it with `/settings` or `"theme": "stylix"` in settings.json.
    home.file.".pi/agent/settings.json".text = builtins.toJSON {
      theme = "stylix";
    };
  };
}
