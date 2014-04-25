love-ludumdare-starter
======================

Löve 2D Game Development Starter Bundle.

##### Want to throw a quick *ludum dare* jam? Take this with you!

This bundle is built for *personal* purposes only. It contains a few important libraries to get quick prototypes done, etc. A simple game state manager in `state_manager.lua` is also provided. Simply follow the pattern of the existing states (`Game.lua` and `Menu.lua`) to get started.

![](http://i.imgur.com/VeBbYyZ.png)

Most assets are coming from a defunct game called [Glitch](http://glitchthegame.com). I miss that game :(

#### 3rd party libraries
- [anim8](https://github.com/kikito/anim8)
- [cron.lua](https://github.com/kikito/cron.lua)
- [lovebird](https://github.com/rxi/lovebird)
- [lume](https://github.com/rxi/lume)
- [lurker](https://github.com/rxi/lurker)
- [middleclass](https://github.com/kikito/middleclass)
- [TEsound](https://github.com/tbergeron/love-ludumdare-starter/blob/master/libs/TEsound.lua#L2)
- [TLfres](https://github.com/tbergeron/love-ludumdare-starter/blob/master/libs/TLfres.lua#L2)
- [tserial](https://github.com/tbergeron/love-ludumdare-starter/blob/master/libs/tserial.lua#L2)

Feel free to contribute and/or report any issues on the github issue tracker.

Getting Started
================

# Installing Love2D in Ubuntu
```
sudo add-apt-repository ppa:bartbes/love-stable
sudo apt-get update
sudo apt-get install love
```

# Running Starter
```
git clone https://github.com/tbergeron/love-ludumdare-starter.git
cd love-ludumdare-starter
git submodule init
git submodule update
love .
```
