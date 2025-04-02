if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add gst git status
    abbr --add v nvim
    abbr --add k kubectl
    abbr --add kpods kubectl get pods -o wide
    abbr --add kswitch kubectl config use-context
    abbr --add kcontexts kubectl config get-contexts

    set -x GPG_TTY "$(tty)"
    alias docker-compose="docker compose"

    # Start the SSH agent
    eval "$(ssh-agent -c)"

    # Add your SSH private key
    ssh-add ~/.ssh/id_ed25519

    # direnv hood to notice changes in env files
    direnv hook fish | source
end
