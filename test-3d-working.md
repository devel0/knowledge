# test 3d working

## prerequisites

```sh
sudo apt install -y nux-tools
```

## test

`Not software rendered` states that 3d work trough GPU

```sh
devel0@tuf:~$ /usr/lib/nux/unity_support_test -p
OpenGL vendor string:   NVIDIA Corporation
OpenGL renderer string: GeForce GTX 1050 Ti/PCIe/SSE2
OpenGL version string:  4.6.0 NVIDIA 418.56

Not software rendered:    yes
Not blacklisted:          yes
GLX fbconfig:             yes
GLX texture from pixmap:  yes
GL npot or rect textures: yes
GL vertex program:        yes
GL fragment program:      yes
GL vertex buffer object:  yes
GL framebuffer object:    yes
GL version is 1.4+:       yes

Unity 3D supported:       yes
```
