## My dots

List of configs to my keyboard-driven system. My point was to get light weight system without useless annoyances.

There are no install scripts atm and things are bit messy, so I wouldn't recommend cloning my entire setup, but instead to try copying bits and pieces as you put together your own dotfiles unique to you.

![2024-09-06-00-06-03_screenshot](https://github.com/user-attachments/assets/9869ce42-c56e-4ca0-a9d5-87495a6f4150)

![image](https://github.com/user-attachments/assets/9beb3cd8-5aa3-4d73-be88-5b2d515ac0d7)

### Software I use

- Distro: [Void](https://voidlinux.org/)
- WM: [River](https://codeberg.org/river/river)
- Bar: [Waybar](https://github.com/Alexays/Waybar)
- Fonts: JetBrains Mono
- Symbols and icons: [Nerd Font Symbols](https://www.nerdfonts.com/)
- GTK-theme: [adw-gtk3](https://github.com/lassekongo83/adw-gtk3)
- Icons: [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Image Viewer: [imv](https://sr.ht/~exec64/imv/)
- Media Player: [mpv](https://mpv.io/)
- Notification daemon: [mako](https://github.com/emersion/mako)
- Terminal [foot](https://codeberg.org/dnkl/foot)
- Cron daemon [snooze](https://github.com/leahneukirchen/snooze)
- Shell: [zsh](https://www.zsh.org/)
- Editor: [neovim](https://neovim.io/)
- Calendar: [Calcure](https://github.com/anufrievroman/calcure)
  - You need **pipx** to install this on **Void** `pipx install calcure`
- Filemanager: [Yazi](https://yazi-rs.github.io/)
- Launcher [bemenu](https://github.com/Cloudef/bemenu)

### Main Keybindings

> Here is a list of the main key combinations, mostly default ones
>
>  The rest can be found in **$HOME/.config/river/init**
>
> If you have used DWM before you are allready home

| Keybind                              | Description                                          |
| ------------------------------------ | ---------------------------------------------------- |
| Super + Enter                        | Open Terminal                                        |
| Super + D                            | Open Bemenu                                          |
| Super + W                            | Open Web Browser                                     |
| Super + {1,2,3,4,5,6,7,8,9}          | View another tag                                     |
| Super + Shift + {1,2,3,4,5,6,7,8,9}a | Move focused tags to another tag view                |
| Super + 0                            | View all tags                                        |
| Super + Alt + {1,2,3,4,5,6,7,8,9}    | Toggle/"combine" different tag views                 |
| Super + Shift + P                    | Open Powermenu                                       |
| Super + {J,K}                        | Focus the next/previous view                         |
| Super + Shift + {J,K}                | Swap the focused view                                |
| Super + {, .}                        | Focus next/previous output                           |
| Super + Shift {, .}                  | Send focused view to the next/previous output        |
| Super + BackSpace                    | Bump the focused view to the top of the layout stack |
| Super + {L,H}                        | Decrease/increase the main ratio of Rivertile        |
| Super + Shift + {Prior,Next}         | Increment/decrement the main count of Rivertile      |
| Super + F                            | Toggle fullscreen                                    |
| Super + Left + Mouse                 | Float and move the window                            |
| Super + Alt + {F10,F12,F11,F9}       | Change layout orientation                            |

#### Sources that I find helpful on my journey

- [SwayKh](https://github.com/SwayKh/dotfiles/tree/main)
- [Official install guide](https://docs.voidlinux.org/installation/index.html)
- [Mind's Forge](https://mindsforge.com/Notes/VoidInstall)
- [kennydodrill.com/blog](https://kennydodrill.com/blog/stable-void-linux-setup-guide/)

#### Inspiration

- [My stars](https://github.com/bitterhalt?tab=stars)

#### Special thanks

- [fesowowako](https://github.com/fesowowako) and his commits from [My Sway-dotfiles](https://github.com/bitterhalt/dots-sway)
