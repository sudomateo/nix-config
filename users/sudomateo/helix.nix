{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        auto-format = false;
        auto-pairs = false;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        mouse = false;
        popup-border = "all";
        shell = [
          "nu"
          "-c"
        ];
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker.hidden = false;
        whitespace = {
          render = {
            space = "none";
            tab = "all";
            nbsp = "none";
            nnbsp = "none";
            newline = "none";
          };
          characters = {
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };
        indent-guides.render = false;
        inline-diagnostics.cursor-line = "error";
        lsp.display-progress-messages = true;
        soft-wrap.enable = true;
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [
            "file-name"
            "read-only-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "position-percentage"
            "file-encoding"
          ];
        };
      };
    };
  };
}
