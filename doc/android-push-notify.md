# android push notify

*[mobile native](../README.md#mobile-native)*

## setup services

- [pushingbox](https://www.pushingbox.com)
- on android install [newtifry](https://newtifry.appspot.com)
  - connect google account
- setup pushingbox
  - services / add a service / newtifry
  - choose a name ( eg. "mobilephone" )
  - paste source api key from newtifry / account and sources / source key
  - scenario / add ( eg. scenario name "videophone bell" )
  - test button
  
## using webapi get

set devid from the one given from Scenario page

```sh
curl "http://api.pushingbox.com/pushingbox?devid=xxxxxx"
```

- [reference](https://www.pushingbox.com/api.php)
