# fast-enter.yazi

![](https://testmnbbs.oss-cn-zhangjiakou.aliyuncs.com/pic/20240605151105_rec_-convert.gif?x-oss-process=base_webp)

Plugin for [Yazi](https://github.com/sxyazi/yazi) to enter the subfolder faster, or open the file directly.

With more features:
- Auto decompress archives and enter it. 
- Go directly to the innermost folder, if there is always only one subfolder

To install, clone the repo inside your `~/.config/yazi/plugins/`:

```bash
git clone https://github.com/ourongxing/fast-enter.yazi.git
```

Or do this, if you have installed yazi v0.3
```shell
ya pack -a ourongxing/fast-enter.yazi
```

Then bind it for `l` key, in your `keymap.toml`:

```toml
[[manager.prepend_keymap]]
on   = [ "l" ]
run  = "plugin --sync fast-enter"
desc = "Enter the subfolder faster, or open the file directly"
```
