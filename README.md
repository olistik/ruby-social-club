# RubySocialClub

Requirements
------------

* postgresql
* redis

Usage
-----

## Local setup

* Create an .env file with the local development settings, e.g.:

```bash
REDISTOGO_URL=redis://localhost:6379/
```

* make sure either Redis and Postgres are running

## Start

```bash
bundle
foreman start
```
The website will be available at the url http://localhost:5000

## Debug

* insert `binding.pry_remote` anywhere in the code
* when the code invoking the above statement, open another shell and call the command `pry-remote`

TODO
----

* write tests
* users profile
* notifications (social/e-mail)
* social share (Google+/Twitter/Facebook)
* talks wish list
* Google Analytics

License
-------

Copyright (c) 2012 Maurizio de Magnis. Distributed under the MIT License. See LICENSE.txt for further details.
