$env.config.show_banner = false

# Rust.
$env.RUSTUP_HOME = $"($env.HOME)/.local/rustup"
$env.CARGO_HOME = $"($env.HOME)/.local/cargo"

# Go.
$env.GOPATH = $"($env.HOME)/.local/gopath"

# Editors.
if (which ^hx | is-not-empty) {
    $env.VISUAL = "hx"
    $env.EDITOR = "hx"
} else if (which ^helix | is-not-empty) {
    $env.VISUAL = "helix"
    $env.EDITOR = "helix"
}

# Add paths.
let new_paths = [
    $"($env.HOME)/.local/bin",
    $"($env.CARGO_HOME)/bin",
    $"($env.GOPATH)/bin",
    $"($env.HOME)/.local/go/bin",
    $"($env.HOME)/.local/zig",
    $"($env.HOME)/bin"
]
$env.PATH = ($env.PATH | append $new_paths)

# Node.js.
if (which ^fnm | is-not-empty) {
    ^fnm env --json | from json | load-env

    $env.PATH = $env.PATH | prepend ($env.FNM_MULTISHELL_PATH | path join (if $nu.os-info.name == 'windows' {''} else {'bin'}))
}

# Use the OpenSSH agent socket.
$env.SSH_AUTH_SOCK = ($env.XDG_RUNTIME_DIR | path join "ssh-agent.socket")

alias hx = helix
