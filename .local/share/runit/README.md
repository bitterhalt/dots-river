# My Runit user services

- These are more like examples how to make Runit user services. To able to run them, you must add and enable **runsdir-user** service.

```
export USER="<username>"
export HOME="/home/<username>"

groups="$(id -Gn "$USER" | tr ' ' ':')"
svdir="$HOME/service"

exec chpst -u "$USER:$groups" runsvdir "$svdir"
```

[More in Void docs](https://docs.voidlinux.org/config/services/user-services.html)
