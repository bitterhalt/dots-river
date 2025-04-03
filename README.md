## My dots

List of configs to my keyboard-driven system. My point was to get light weight system without useless annoyances.

There are no install scripts atm and things are bit messy, so I wouldn't recommend cloning my entire setup, but instead to try copying bits and pieces as you put together your own dotfiles unique to you.

![image](https://github.com/user-attachments/assets/71a11303-ba84-41cd-a616-2960a35618b4)

### Software I use

- Distro: [Void](https://voidlinux.org/)
- WM: [River](https://codeberg.org/river/river)
- Session and Seat management: [seatd](https://docs.voidlinux.org/config/session-management.html#seatd) and [turnstile](https://docs.voidlinux.org/config/session-management.html#turnstile)
- Bar: [Waybar](https://github.com/Alexays/Waybar)
- Tag-overlay: [river-tag-overlay](https://git.sr.ht/~leon_plickat/river-tag-overlay)
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

---

### ! ! ! IMPORTANT ! ! !

> If you have just installed Void and copy pasted everything from here, you won't get working system just yet!
>
> Check out ~/.local/bin/void/void_kickstart.sh to get the idea what services are needed!
>
> Good luck!

---

### Main key bindings

> Here is a list of the main key combinations, mostly default ones
>
> The rest can be found in **$HOME/.config/river/init**
>
> If you have used DWM before you are already home

| Keybind                               | Description                                          |
| ------------------------------------- | ---------------------------------------------------- |
| Super + Enter                         | Open Terminal                                        |
| Super + D                             | Open Bemenu                                          |
| Super + Control + R                   | Reload config                                        |
| Super + W                             | Open Web Browser                                     |
| Super + E                             | Open Filemanager                                     |
| Super + {1,2,3,4,5,6,7,8,9}           | View another tag                                     |
| Super + Shift + {1,2,3,4,5,6,7,8,9}   | Move focused tags to another tag view                |
| Super + 0                             | View all tags                                        |
| Super + Control + {1,2,3,4,5,6,7,8,9} | Toggle/"combine" different tag views                 |
| Super + Shift + P                     | Open Powermenu                                       |
| Super + {J,K}                         | Focus the next/previous view                         |
| Super + Shift + {J,K}                 | Swap the focused view                                |
| Super + {, .}                         | Focus next/previous output                           |
| Super + Shift {, .}                   | Send focused view to the next/previous output        |
| Super + BackSpace                     | Bump the focused view to the top of the layout stack |
| Super + {L,H}                         | Decrease/increase the main ratio of Rivertile        |
| Super + Shift + {Prior,Next}          | Increment/decrement the main count of Rivertile      |
| Super + F                             | Toggle fullscreen                                    |
| Super + Left + Mouse                  | Float and move the window                            |
| Super + Alt + {H,J,K,L}               | Change layout orientation {left,bottom,top,right}    |

#### Sources where I stole most of my cool stuff

- [SwayKh](https://github.com/SwayKh/dotfiles/tree/main) - Showed me how to configure River 😍
- [Official install guide](https://docs.voidlinux.org/installation/index.html) - Helped me to setup Void 👍
- [kennydodrill.com/blog](https://kennydodrill.com/blog/stable-void-linux-setup-guide/) - Helped me to setup Void 👍
- [Mind's Forge](https://mindsforge.com/Notes/VoidInstall) - Helped me setup Wayland ⭐
- [newmanls](https://github.com/newmanls/dotfiles) - Helped me with TONS of stuff ⭐
- [classabbyamp](https://github.com/classabbyamp) - Helped me with TONS of stuff ⭐
- [aellas](https://github.com/aellas) - For TONS of ideas and ispiration ⭐ ❤️ 🐐

#### Special thanks ⭐

- [fesowowako](https://github.com/fesowowako) and his commits from [My Sway-dotfiles](https://github.com/bitterhalt/dots-sway)
