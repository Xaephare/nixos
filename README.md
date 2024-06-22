_This is pretty much just for me_

__On a clean NixOs install open a terminal and paste:__  
```
cd /etc/nixos && sudo rm -r nixos
```
__Then regenerate the hardware config file with:__  
```
sudo nixos-generate-config
```
__Next rebuild using:__  
```
sudo nixos-rebuild switch --flake '/etc/nixos#default'
```
