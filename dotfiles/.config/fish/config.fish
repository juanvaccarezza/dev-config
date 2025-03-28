fish_config theme choose 'Catppuccin Mocha'
nvm use latest

fish_add_path --path $HOME/bin
fish_add_path --path $HOME/.local/bin
fish_add_path --path /usr/local/go/bin
fish_add_path --path $HOME/go/bin
fish_add_path --path $HOME/.cargo/bin

set -gx EDITOR nvim

alias v nvim
alias vi nvim
alias vim nvim
alias passsso "pass -c jivaccarezza@domain.invap.com.ar"
alias passalfresco "pass -c jivaccarezza@domain.invap.com.ar"

abbr --add o xdg-open

if status is-interactive
    # Commands to run in interactive sessions can go here
end
