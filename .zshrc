# ~/.zshrc — read by zsh every time you open an interactive terminal.
#
# zsh is the default shell on macOS. It does NOT read ~/.bashrc.
# After editing, apply your changes to the current terminal with:
#     source ~/.zshrc

# ---------------------------------------------------------------------------
# oh-my-zsh: a framework that adds themes, plugins, and sensible defaults.
# https://ohmyz.sh   (install.sh in this repository installs it for you)
# ---------------------------------------------------------------------------
export ZSH=/home/esimpson07/.oh-my-zsh

# Prompt theme. Browse the options at
#   https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# robbyrussell (the default) shows the current directory and git branch,
# and turns the arrow red when the last command failed.
ZSH_THEME=robbyrussell

# Plugins live in /plugins. Each one adds features or aliases.
#   git                 ~150 shortcuts, e.g.  for On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	.bashrc
	README.md

nothing added to commit but untracked files present (use "git add" to track).
#                       Learn the full commands first; the shortcuts can wait.
#   colored-man-pages   makes  pages easier to read
plugins=(git colored-man-pages)

# Remind me about oh-my-zsh updates instead of updating silently.
zstyle ':omz:update' mode reminder

if [ -d  ]; then
    source /oh-my-zsh.sh
else
    # oh-my-zsh is not installed: use a plain prompt that still shows
    # the git branch, e.g.   user@host:~/cs240/hw1 (main)%
    autoload -Uz vcs_info
    precmd() { vcs_info }
    zstyle ':vcs_info:git:*' formats ' (%b)'
    setopt PROMPT_SUBST
    PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}%f%# '

    autoload -Uz compinit && compinit    # tab completion
fi

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000              # commands remembered in this session
SAVEHIST=20000              # commands saved to ~/.zsh_history
setopt HIST_IGNORE_DUPS     # skip a command identical to the previous one
setopt HIST_IGNORE_SPACE    # skip commands that start with a space
setopt SHARE_HISTORY        # all open terminals share one history

# ---------------------------------------------------------------------------
# Aliases: the same ones as in bashrc, so both shells feel the same
# ---------------------------------------------------------------------------
if ls --color=auto / >/dev/null 2>&1; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias ll='ls -alF'
alias la='ls -A'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias gccw='gcc -Wall -Wextra -g'
alias gdb='gdb -q'
alias grep='grep --color=auto'

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------
export EDITOR=vim
export PAGER=less

if [ -d /home/esimpson07/bin ]; then
    PATH=/home/esimpson07/bin:/home/esimpson07/.local/bin:/home/esimpson07/.bun/bin:/home/esimpson07/.cargo/bin:/home/esimpson07/.opencode/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Program Files/WindowsApps/MicrosoftCorporationII.WindowsSubsystemForLinux_2.7.10.0_x64__8wekyb3d8bbwe:/mnt/c/Program Files/Python310/Scripts/:/mnt/c/Program Files/Python310/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Program Files/Common Files/Oracle/Java/javapath:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files/Intel/WiFi/bin/:/mnt/c/Program Files/Common Files/Intel/WirelessCommon/:/mnt/c/Program Files/PuTTY/:/mnt/c/Program Files/CMake/bin:/mnt/c/Program Files (x86)/IVI Foundation/VISA/WinNT/Bin:/mnt/c/Windows/system32/config/systemprofile/AppData/Local/Muse Hub/lib:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/nodejs/:/mnt/c/Program Files/GitHub CLI/:/mnt/c/Users/edwar/AppData/Local/Programs/OpenAI/Codex/bin:/mnt/c/Users/edwar/.local/bin:/mnt/c/Users/edwar/.cargo/bin:/mnt/c/Users/edwar/AppData/Local/Programs/Python/Python39/Scripts/:/mnt/c/Users/edwar/AppData/Local/Programs/Python/Python39/:/mnt/c/Users/edwar/AppData/Local/Programs/Python/Python314/Scripts/:/mnt/c/Users/edwar/AppData/Local/Programs/Python/Python314/:/mnt/c/Users/edwar/scoop/shims:/mnt/c/Users/edwar/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/edwar/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/edwar/AppData/Local/GitHubDesktop/bin:/mnt/c/Users/edwar/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0/LocalCache/local-packages/Python39/site-packages:/mnt/c/Users/edwar/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0/LocalCache/local-packages/Python39/Scripts/wheel.exe:/mnt/c/Users/edwar/AppData/Local/Microsoft/WindowsApps:/mnt/c/Program Files/CMake/bin:/mnt/c/Users/edwar/Downloads/opencv/build/bin:/mnt/c/Program Files/JetBrains/IntelliJ IDEA Community Edition 2022.2.1/bin:/mnt/c/Users/edwar/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0/LocalCache/local-packages/Python39/Scripts:/mnt/c/Users/edwar/.lmstudio/bin:/mnt/c/opencv/build/x64/vc16/bin:/mnt/c/Users/edwar/.fly/bin:/mnt/c/Program Files/LLVM/bin:/mnt/c/Users/edwar/AppData/Roaming/npm:/mnt/c/Users/edwar/AppData/Local/Google/Cloud SDK/google-cloud-sdk/bin:/mnt/c/Users/edwar/bin:/snap/bin
fi

# boilersay
export PATH="$HOME/.local/bin:$PATH"
alias boilersay='cowsay -f train'
alias hail='printf "Hammer Up\nBoiler Down\nHail Purdue\n" | boilersay -n'
