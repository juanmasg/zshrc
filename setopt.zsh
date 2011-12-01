# share history
setopt appendhistory
setopt sharehistory

setopt automenu
setopt histverify
setopt longlistjobs
setopt autoparamkeys
setopt autoparamslash

# Ignore duplicate in history.
setopt histignoredups

# Prevent record in history entry if preceding them with at least one space
setopt histignorespace

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol

