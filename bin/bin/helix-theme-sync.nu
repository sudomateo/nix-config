#! /usr/bin/env nu

const helix_config = ($nu.home-path | path join ".config/helix/config.toml")

# Looks complex but it's not bad.
# \K      -> Discards what came before and keeps what follows.
# (?=...) -> A lookahead to ensure what matches isn't replaced.
const regex = '^theme\s+=\s+"\K\w+(?=".*)'

let is_dark = (open ~/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark | str trim | into bool)

# We specifically use `open --raw` with `str replace` to prevent Nushell from
# changing the format of the TOML file (e.g., don't remove extra spacing).
if $is_dark {
  open --raw $helix_config | str replace --regex $regex 'gruvbox' | save -f $helix_config
} else {
  open --raw $helix_config | str replace --regex $regex 'gruvbox_light' | save -f $helix_config
}
