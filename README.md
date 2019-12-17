# MegaCMD Get
This container pulls down a single Mega folder and stores it in the current directory using the `mega-get` command 
from the [MEGAcmd](https://github.com/meganz/MEGAcmd) repository.
 
### Usage
```
docker run \
  --interactive \
  --tty \
  --rm \
  --volume $(pwd):/data \
  radpenguin/megacmd-get \
  'https://mega.nz/#F!ABCD1234'
```

### Notes
Thanks to [@danielquinn](https://danielquinn.org/) for his [MEGAcmd for Alpine Linux](https://gitlab.com/danielquinn/megacmd-alpine/) repo, which made creating this container much, much easier.
