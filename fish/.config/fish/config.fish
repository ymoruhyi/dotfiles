if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add gst git status
    abbr --add v nvim
    abbr --add k kubectl
    abbr --add kpods kubectl get pods -o wide
    abbr --add kswitch kubectl config use-context
    abbr --add kcontexts kubectl config get-contexts

    set -x GPG_TTY "$(tty)"
    set -gx PATH $PATH $HOME/.krew/bin
    alias docker-compose="docker compose"

    # SSH agent is managed by keychain in conf.d/keychain.fish
    # eval "$(ssh-agent -c)"
    # ssh-add ~/.ssh/id_ed25519

    # direnv hood to notice changes in env files
    direnv hook fish | source
end
