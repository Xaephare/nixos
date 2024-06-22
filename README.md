_This is pretty much just for me_

__On a clean NixOs install open a terminal and paste:__  
```
cd /etc ; sudo rm -r nixos
```
__Clone the repo:__  
```
sudo git clone https://github.com/Xaephare/nixos.git
```
__Then regenerate the hardware config file with:__  
```
sudo nixos-generate-config
```
__Next rebuild using:__  
```
sudo nixos-rebuild switch --flake '/etc/nixos#default'
```
