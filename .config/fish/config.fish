# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# this function may be required
function fish_title
  true
end

# aliases
alias q="exit"
alias :q="exit"
alias tidy="tidy --indent auto --wrap 0"
alias nano="nano -w"
alias pwnice="pwgen -AB1 8"
alias wget-mirror="wget -w 1 --random-wait -m --no-parent -p -k -U \"User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-GB; rv:1.9.2.7) Gecko/20100723 Fedora/3.6.7-1.fc13 Firefox/3.6.7\" -e robots=off"
