## Arch LInux Solved

## error: failed to synchronize all databases (unable to lock database) ([solved](https://suay.site/?p=1969))

```
$ sudo rm /var/lib/pacman/db.lck
```
If you are unsure whether to delete the db.lck file, you can check its creation date as follows:

```
$ ls -l /var/lib/pacman/db.lck
```
