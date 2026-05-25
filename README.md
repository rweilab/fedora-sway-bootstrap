Built for Fedora 44 Sway Spin.  
Last checked for compatibility `2026-05-21`  
Integrates dotfiles from: https://github.com/rweilab/dots-fedora-sway via `chezmoi`  
Brings the time cost of provisioning a new machine from days to **within an hour**.  

Due to the scope of Linux sysadmin, I will probably end up selling my spare Thinkpads to stop tinker creep.  

```bash
git clone https://github.com/rweilab/fedora-sway-bootstrap.git ~/repos/provision
cd ~/repos/provision
chmod +x *.sh
./bootstrap.sh
```

Includes but not limited to:  
- Customized Neovim configuration complete with:  
    - Zettelkasten-style linked/backlink notes + Obsidian compatability through markdown-oxide LSP
    - Fuzzy find/grep files and builtin file explorer
    - LSPConfig LSP name compatability with Mason installer
    - Codelens automatic enabling on .md files and automatic file creation for referenced nonexistent notes through codeaction
- Doom Emacs installtion with:
    - Custom Agenda view through `SPC-o-a-a-c` for Overdue/Multi-Day/Unscheduled TODOs
    - NOTE: Make sure to hit `y` to generating envvar files during bootstrap
- Sway+VNC script to allow any device with VNC viewer to be used as an **extended display**
- CLI day progress bar written in Python to track progress towards important dates
    - Supports 24-bit color through ANSI codes and rendering with LERP between two colors
- Firefox improvements (opinionated) including:
    - Automatic profile detection for Betterfox user.js overrides + custom additional hardening + dark mode
    - userChrome.css to remove/auto-hide nav bar with **expected Sideberry** use to optimize usable screen space
- Zsh installation with prewarmed Zinit plugins for:
    - Multi-word search history & autosuggestions
    - Fast syntax highlighting, fzf-search, and useful Git aliases
- Flatpak/Flathub/Warehouse automatic sourcing/installation
- Background changing script complete with autodetection via symlinks in ~/bin for easy access with `changebg`
