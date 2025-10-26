# Run keychain for all interactive shells
if status is-interactive
    # Set the SSH keys to be managed by keychain.
    # Replace ~/.ssh/id_ed25519 with the paths to your actual private keys.
    set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519

    # Evaluate keychain's output to set up ssh-agent and add keys
    # The --quiet flag reduces output noise
    keychain --eval --quiet $SSH_KEYS_TO_AUTOLOAD | source
end
