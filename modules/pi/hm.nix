# pi loads themes from `~/.pi/agent/themes/*.json` and activates one through the
# `theme` key in `~/.pi/agent/settings.json`. We only write the theme file here,
# leaving `settings.json` (which also holds user-managed settings) untouched.
# Select the generated theme via `/settings` or `"theme": "stylix"`.
#
# Theme format reference:
# https://github.com/earendil-works/pi/blob/main/packages/coding-agent/docs/themes.md
{ mkTarget, ... }:
mkTarget {
  config =
    { colors }:
    {
      home.file.".pi/agent/themes/stylix.json".text = builtins.toJSON {
        "$schema" =
          "https://raw.githubusercontent.com/earendil-works/pi/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json";
        name = "stylix";
        colors = with colors.withHashtag; {
          # Core UI
          # base0E is the strongest non-primary accent in the base16 contract
          # (e.g. catppuccin's signature mauve), giving the logo/cursor/selection
          # more identity than the base0D "links" slot.
          accent = base0E;
          border = base02;
          borderAccent = base0D;
          borderMuted = base01;
          success = base0B;
          error = base08;
          warning = base0A;
          muted = base04;
          dim = base03;
          text = base05;
          thinkingText = base04;

          # Backgrounds & content
          selectedBg = base02;
          userMessageBg = base01;
          userMessageText = base05;
          customMessageBg = base01;
          customMessageText = base05;
          customMessageLabel = base0D;
          toolPendingBg = base01;
          toolSuccessBg = base01;
          toolErrorBg = base01;
          toolTitle = base0D;
          toolOutput = base05;

          # Markdown
          mdHeading = base0E;
          mdLink = base0D;
          mdLinkUrl = base0C;
          mdCode = base0B;
          mdCodeBlock = base05;
          mdCodeBlockBorder = base03;
          mdQuote = base03;
          mdQuoteBorder = base03;
          mdHr = base04;
          mdListBullet = base0C;

          # Tool diffs
          toolDiffAdded = base0B;
          toolDiffRemoved = base08;
          toolDiffContext = base03;

          # Syntax highlighting
          # base04 (not base03) keeps comments legible against base00; base03 is
          # reserved for borders and rules where low contrast is acceptable.
          syntaxComment = base04;
          syntaxKeyword = base0E;
          syntaxFunction = base0D;
          # base07 keeps variables calm and close to body text (matching the
          # sibling opencode module) rather than the vivid base08 "red" slot.
          syntaxVariable = base07;
          syntaxString = base0B;
          syntaxNumber = base09;
          syntaxType = base0A;
          syntaxOperator = base0C;
          syntaxPunctuation = base05;

          # Thinking level borders (subtle -> prominent)
          thinkingOff = base03;
          thinkingMinimal = base04;
          thinkingLow = base0D;
          thinkingMedium = base0C;
          thinkingHigh = base0E;
          thinkingXhigh = base08;

          # Bash mode
          bashMode = base09;
        };

        # HTML export colors for `/export`.
        export = with colors.withHashtag; {
          pageBg = base00;
          cardBg = base01;
          infoBg = base02;
        };
      };
    };
}
