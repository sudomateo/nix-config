{ ... }:
{
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        ui = {
          skin = "gruvbox-light";
        };
      };
    };
    skins = {
      gruvbox-dark = {
        k9s = {
          body = {
            fgColor = "#ebdbb2";
            bgColor = "#272727";
            logoColor = "#448488";
          };
          prompt = {
            fgColor = "#ebdbb2";
            bgColor = "#272727";
            suggestColor = "#d79920";
          };
          info = {
            fgColor = "#b16185";
            sectionColor = "#ebdbb2";
          };
          help = {
            fgColor = "#ebdbb2";
            bgColor = "#272727";
            keyColor = "#b16185";
            numKeyColor = "#448488";
            sectionColor = "#989719";
          };
          dialog = {
            fgColor = "#ebdbb2";
            bgColor = "#272727";
            buttonFgColor = "#ebdbb2";
            buttonBgColor = "#b16185";
            buttonFocusFgColor = "white";
            buttonFocusBgColor = "#689d69";
            labelFgColor = "#d79920";
            fieldFgColor = "#ebdbb2";
          };
          frame = {
            border = {
              fgColor = "#3c3735";
              focusColor = "#ebdbb2";
            };
            menu = {
              fgColor = "#ebdbb2";
              keyColor = "#b16185";
              numKeyColor = "#b16185";
            };
            crumbs = {
              fgColor = "#ebdbb2";
              bgColor = "#bdad93";
              activeColor = "#448488";
            };
            status = {
              newColor = "#689d69";
              modifyColor = "#448488";
              addColor = "#989719";
              errorColor = "#cc231c";
              highlightColor = "#d79920";
              killColor = "#bdad93";
              completedColor = "#bdad93";
            };
            title = {
              fgColor = "#ebdbb2";
              bgColor = "#272727";
              highlightColor = "#d79920";
              counterColor = "#448488";
              filterColor = "#b16185";
            };
          };
          views = {
            charts = {
              bgColor = "background";
              defaultDialColors = [
                "#448488"
                "#cc231c"
              ];
              defaultChartColors = [
                "#448488"
                "#cc231c"
              ];
            };
            table = {
              fgColor = "#ebdbb2";
              bgColor = "#272727";
              cursorFgColor = "#fff";
              cursorBgColor = "#ebdbb2";
              header = {
                fgColor = "#ebdbb2";
                bgColor = "#272727";
                sorterColor = "#3c3735";
              };
            };
            xray = {
              fgColor = "#ebdbb2";
              bgColor = "#272727";
              cursorColor = "#ebdbb2";
              graphicColor = "#448488";
              showIcons = false;
            };
            yaml = {
              keyColor = "#b16185";
              colonColor = "#448488";
              valueColor = "#ebdbb2";
            };
            logs = {
              fgColor = "#ebdbb2";
              bgColor = "#272727";
              indicator = {
                fgColor = "#ebdbb2";
                bgColor = "#272727";
              };
            };
          };
        };
      };
      gruvbox-light = {
        k9s = {
          body = {
            fgColor = "#3c3735";
            bgColor = "#fbf1c7";
            logoColor = "#448488";
          };
          prompt = {
            fgColor = "#3c3735";
            bgColor = "#fbf1c7";
            suggestColor = "#d79920";
          };
          info = {
            fgColor = "#b16185";
            sectionColor = "#3c3735";
          };
          help = {
            fgColor = "#3c3735";
            bgColor = "#fbf1c7";
            keyColor = "#b16185";
            numKeyColor = "#448488";
            sectionColor = "#989719";
          };
          dialog = {
            fgColor = "#3c3735";
            bgColor = "#fbf1c7";
            buttonFgColor = "#3c3735";
            buttonBgColor = "#b16185";
            buttonFocusFgColor = "white";
            buttonFocusBgColor = "#689d69";
            labelFgColor = "#d79920";
            fieldFgColor = "#3c3735";
          };
          frame = {
            border = {
              fgColor = "#3c3735";
              focusColor = "#ebdbb2";
            };
            menu = {
              fgColor = "#3c3735";
              keyColor = "#b16185";
              numKeyColor = "#b16185";
            };
            crumbs = {
              fgColor = "#3c3735";
              bgColor = "#bdad93";
              activeColor = "#448488";
            };
            status = {
              newColor = "#689d69";
              modifyColor = "#448488";
              addColor = "#989719";
              errorColor = "#cc231c";
              highlightColor = "#d79920";
              killColor = "#bdad93";
              completedColor = "#bdad93";
            };
            title = {
              fgColor = "#3c3735";
              bgColor = "#fbf1c7";
              highlightColor = "#d79920";
              counterColor = "#448488";
              filterColor = "#b16185";
            };
          };
          views = {
            charts = {
              bgColor = "background";
              defaultDialColors = [
                "#448488"
                "#cc231c"
              ];
              defaultChartColors = [
                "#448488"
                "#cc231c"
              ];
            };
            table = {
              fgColor = "#3c3735";
              bgColor = "#fbf1c7";
              cursorFgColor = "#3c3735";
              cursorBgColor = "#ebdbb2";
              header = {
                fgColor = "#3c3735";
                bgColor = "#fbf1c7";
                sorterColor = "#3c3735";
              };
            };
            xray = {
              fgColor = "#3c3735";
              bgColor = "#fbf1c7";
              cursorColor = "#ebdbb2";
              graphicColor = "#448488";
              showIcons = false;
            };
            yaml = {
              keyColor = "#b16185";
              colonColor = "#448488";
              valueColor = "#3c3735";
            };
            logs = {
              fgColor = "#3c3735";
              bgColor = "#fbf1c7";
              indicator = {
                fgColor = "#3c3735";
                bgColor = "#fbf1c7";
                toggleOnColor = "#b16185";
                toggleOffColor = "#448488";
              };
            };
          };
        };
      };
    };
  };
}
