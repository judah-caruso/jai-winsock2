# Winsock 2

Winsock 2 bindings for the Jai language. [1]

# Usage

This depends on the static version of my [C interop module](https://github.com/judah-caruso/C) (already included) and the [Winsock 1 module](https://github.com/judah-caruso/jai-winsock); I recommend putting it in a vendor directory that's added to your build's import_path. [2]

```shell
mkdir vendor && cd vendor/
git clone https://github.com/judah-caruso/jai-winsock Winsock
git clone https://github.com/judah-caruso/jai-winsock2 Winsock2
```

# Notes

[1] Unlike the real Winsock 1-2, jai-winsock2 relies on the first and binds everything extended from it. This might be a bad idea long-term as the actual Winsock doesn't work like this so why do the bindings? I will most likely change this and make this module a non-backwards-compatible-but-drop-in-replacement for jai-winsock like the actual *libraries* are.  

[2] If this proves to be too annoying for people to use, I'll make this module freestanding. 
