## My dots

List of configs to my keyboard-driven system. My point was to get light weight system without useless annoyances.

There are no install scripts atm and things are bit messy, so I wouldn't recommend cloning my entire setup, but instead to try copying bits and pieces as you put together your own dotfiles unique to you.

![image](https://github.com/user-attachments/assets/605eae71-5b17-40c4-ab4c-4f88ddb68700)

### Software I use

- Distro: [Void](https://voidlinux.org/)
- WM: [River](https://codeberg.org/river/river)
- Bar: [Waybar](https://github.com/Alexays/Waybar)
- Fonts: JetBrains Mono
- Symbols and icons: [Nerd Font Symbols](https://www.nerdfonts.com/)
- GTK-theme: [adw-gtk3](https://github.com/lassekongo83/adw-gtk3)
- Icons: [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Image Viewer: [swayimg](https://github.com/artemsen/swayimg)
- Media Player: [mpv](https://mpv.io/)
- Notification daemon: [mako](https://github.com/emersion/mako)
- Terminal [foot](https://codeberg.org/dnkl/foot)
- Cron daemon [snooze](https://github.com/leahneukirchen/snooze)
- Shell: [zsh](https://www.zsh.org/)
- Editor: [neovim](https://neovim.io/)
- Filemanager: [Yazi](https://yazi-rs.github.io/)
- Launcher [bemenu](https://github.com/Cloudef/bemenu)

### Main key bindings

> Here is a list of the main key combinations, mostly default ones
>
> The rest can be found in **$HOME/.config/river/init**
>
> If you have used DWM before you are already home

| Keybind                               | Description                                                                          |
| ------------------------------------- | ------------------------------------------------------------------------------------ |
| Super + Enter                         | Open Terminal                                                                        |
| Super + D                             | Open Bemenu as drun node with [j4-dmenu](https://github.com/enkore/j4-dmenu-desktop) |
| Super + Control + R                   | Reload config                                                                        |
| Super + Shift + D                     | Open Bemenu as run mode                                                              |
| Super + W                             | Open Web Browser                                                                     |
| Super + E                             | Open TUI Filemanager                                                                 |
| Super Shift + E                       | Open GUI Filemanager                                                                 |
| Super + {1,2,3,4,5,6,7,8,9}           | View another tag                                                                     |
| Super + Shift + {1,2,3,4,5,6,7,8,9}   | Move focused tags to another tag view                                                |
| Super + 0                             | View all tags                                                                        |
| Super + Control + {1,2,3,4,5,6,7,8,9} | Toggle/"combine" different tag views                                                 |
| Super + Shift + P                     | Open Powermenu                                                                       |
| Super + {J,K}                         | Focus the next/previous view                                                         |
| Super + Shift + {J,K}                 | Swap the focused view                                                                |
| Super + {, .}                         | Focus next/previous output                                                           |
| Super + Shift {, .}                   | Send focused view to the next/previous output                                        |
| Super + BackSpace                     | Bump the focused view to the top of the layout stack                                 |
| Super + {L,H}                         | Decrease/increase the main ratio of Rivertile                                        |
| Super + Shift + {Prior,Next}          | Increment/decrement the main count of Rivertile                                      |
| Super + F                             | Toggle fullscreen                                                                    |
| Super + Left + Mouse                  | Float and move the window                                                            |
| Super + Alt + {H,J,K,L}               | Change layout orientation {left,bottom,top,right}                                    |

#### Sources that I find helpful on my journey

- [SwayKh](https://github.com/SwayKh/dotfiles/tree/main) - Showed me how to configure River 😍
- [Official install guide](https://docs.voidlinux.org/installation/index.html) - Helped me to setup Void 👍
- [kennydodrill.com/blog](https://kennydodrill.com/blog/stable-void-linux-setup-guide/) - Helped me to setup Void 👍
- [Mind's Forge](https://mindsforge.com/Notes/VoidInstall) - Helped me setup Wayland ⭐
- [newmanls](https://github.com/newmanls/dotfiles) - Helped me with TONS of stuff ⭐

### Todo

> Nothing is perfect but here are some important reminders what needs to be done

- [ ] Add install script to setup environment after Void install
- [ ] Add list of all the key binds, for this I need to make some sort of parser script because things live in the river init

#### Inspiration

- [My stars](https://github.com/bitterhalt?tab=stars)

#### Special thanks ⭐

- [fesowowako](https://github.com/fesowowako) and his commits from [My Sway-dotfiles](https://github.com/bitterhalt/dots-sway)
