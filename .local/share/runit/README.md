# Runit user services
#### These are more like examples how to make Runit user services. To able to run them, you must add and enable **runsdir-user** service:
```
export USER="<username>"
export HOME="/home/<username>"

groups="$(id -Gn "$USER" | tr ' ' ':')"
svdir="$HOME/service"

exec chpst -u "$USER:$groups" runsvdir "$svdir"
```
#### Start services
1. Make dir for services: `mkdir -p dir $HOME/.local/share/runit/service`
2. Make symlinks: `ln -s ~/.local/share/runit/sv/<your_service> ~/.local/share/runit/service/`
3. Check the status: `sv status ~/.local/share/runit/service/*`



[More in Void docs](https://docs.voidlinux.org/config/services/user-services.html)


