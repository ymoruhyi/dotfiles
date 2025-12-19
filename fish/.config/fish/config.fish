if status is-interactive
    # Disable greeting message
    set -g fish_greeting
    
    # Set default nvm version if not already set
    if not set -q nvm_default_version
        set -Ux nvm_default_version v22.12.0
    end
    
    # Ensure nvm version is activated
    if set -q nvm_default_version && ! command -v node &>/dev/null
        nvm use --silent $nvm_default_version
    end
    
    # Commands to run in interactive sessions can go here
    abbr --add gst git status
    abbr --add v nvim
    abbr --add k kubectl
    abbr --add kpods kubectl get pods -o wide
    abbr --add kswitch kubectl config use-context
    abbr --add kcontexts kubectl config get-contexts

    set -x GPG_TTY "$(tty)"
    set -gx PATH $PATH $HOME/.krew/bin
    set -gx PATH $PATH $HOME/.local/scripts
    alias docker-compose="docker compose"

    # SSH agent is managed by keychain in conf.d/keychain.fish
    # eval "$(ssh-agent -c)"
    # ssh-add ~/.ssh/id_ed25519

    # direnv hood to notice changes in env files
    direnv hook fish | source
end
