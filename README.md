```sh
nix eval --show-trace --json .#__std.ci.x86_64-linux
```
```sh
[{"action":"build","actionDrv":"/nix/store/4fp8dnmx0cif4dxfkw59mh80swfr2fma-build.drv","block":"packages","blockType":"installables","cell":"cell1","meta":null,"name":"jq","proviso":"/nix/store/iv73wa13cjq0z9anygwag4gpmyy4ab9h-incl/std/fwlib/actions/build-proviso.sh","targetDrv":"/nix/store/56p7bxvyxhm78m3qj8k5fa9i2k09926h-jq-1.6.drv"}]
```
