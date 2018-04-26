# test swap memory

*development*

Follows an example to test PHY RAM + SWAP RAM docker test, thanks Sergey L. [post](https://stackoverflow.com/questions/17935873/malloc-fails-when-there-is-still-plenty-of-swap-left?answertab=active#tab-top)

```c
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <unistd.h>

int main() {
    char * page;
    size_t memory_allocated = 0;
    while ((page = (char*)mmap(NULL, sysconf(_SC_PAGE_SIZE)
                        , PROT_READ | PROT_WRITE
                        , MAP_ANON | MAP_PRIVATE, -1, 0))
                 != MAP_FAILED) {
        memory_allocated += sysconf(_SC_PAGE_SIZE);
        // optionally touch the page
        // otherwise the mapping won't use physical RAM/swap
        *page = 1;
        printf("mem mb = %lu\n", memory_allocated / 1024 / 1024);
    }

    fprintf(stderr, "Allocated %zu MiB\n", memory_allocated >> 20);
    perror("mmap");
    return 0;
}
```

just save into a test.c and run the follow

```sh
gcc test.c && ./a.out
```

from an [ubuntu](https://github.com/devel0/docker-ubuntu) container

```sh
docker run --name=memtest --memory=16m --memory-swap=16m -ti searchathing/ubuntu /bin/bash
```

## test 16MB RAM + 16MB SWAP

```
mem mb = 0
...
mem mb = 12
mem mb = 13
Killed
```

## test 16MB RAM + 32MB SWAP

update container memory layout with follow

```sh
docker update --memory=16m --memory-swap=32m memtest
```

results

```
mem mb = 0
...
mem mb = 28
mem mb = 28
Killed
```
