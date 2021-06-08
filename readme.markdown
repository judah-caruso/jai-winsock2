# Winsock 2

Winsock 2 bindings for the Jai language.

# Usage

This depends on my [C interop module](https://github.com/judah-caruso/C) and the [Winsock 1 module](https://github.com/judah-caruso/jai-winsock).
I recommend putting dependencies in a vendor directory that's added to your build's import_path.

I've separated these modules so you can pull them in separately as you would in C++.

```shell
mkdir vendor && cd vendor/
git clone https://github.com/judah-caruso/C
git clone https://github.com/judah-caruso/jai-winsock Winsock
git clone https://github.com/judah-caruso/jai-winsock2 Winsock2
```

If this proves to be too annoying for users, I'll make this module freestanding and remove the interop module dependency.
