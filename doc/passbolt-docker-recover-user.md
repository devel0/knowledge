# passbolt

## recover user from a docker non compose install

- assume two container "sec-db" and "sec-app"

```sh
docker exec -u www-data -ti sec-app /bin/bash

www-data@705cfac12003:/usr/share/php/passbolt$ /usr/share/php/passbolt/bin/cake passbolt recover_user -c -u MAIL@SOME.COM
```