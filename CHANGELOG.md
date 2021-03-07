# Changelog

# [0.7.0](https://github.com/saltstack-formulas/nifi-formula/compare/v0.6.0...v0.7.0) (2021-03-07)


### Continuous Integration

* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] ([099d4c9](https://github.com/saltstack-formulas/nifi-formula/commit/099d4c9714de42a9b7e31f383794e0aeda571317))


### Features

* **formula:** add missing default ([bcc6cfa](https://github.com/saltstack-formulas/nifi-formula/commit/bcc6cfa85baa8243d7c864781a6a3771e617aa3b))
* **formula:** template log levels ([3349fbc](https://github.com/saltstack-formulas/nifi-formula/commit/3349fbca848c9fa31328496dfe032fa48bae6e97))

# [0.6.0](https://github.com/saltstack-formulas/nifi-formula/compare/v0.5.0...v0.6.0) (2021-03-06)


### Continuous Integration

* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] ([221c1dd](https://github.com/saltstack-formulas/nifi-formula/commit/221c1ddcb88f81ccfe5ca1870922e7c7fed03a80))


### Features

* **formula:** should not config firewall kernel params ([5b65453](https://github.com/saltstack-formulas/nifi-formula/commit/5b6545394978cae06276010168288133cfc0ff8d))

# [0.5.0](https://github.com/saltstack-formulas/nifi-formula/compare/v0.4.0...v0.5.0) (2021-03-04)


### Features

* **formula:** import nifi ([233d3e3](https://github.com/saltstack-formulas/nifi-formula/commit/233d3e36b985a0a824c2320c2364b3d9e89f9b38))
* **formula:** pillar sysctl settings ([b1c31af](https://github.com/saltstack-formulas/nifi-formula/commit/b1c31afa8d05adfb8941b3d46c76d9d6bedfe7ff))
* **formula:** sysctl doesnt run in docker ([38fc8cd](https://github.com/saltstack-formulas/nifi-formula/commit/38fc8cd9f879f57ec1ae44ed71c9557c2d8c7d7c))

# [0.4.0](https://github.com/saltstack-formulas/nifi-formula/compare/v0.3.0...v0.4.0) (2021-02-19)


### Bug Fixes

* false should be string ([5b266c2](https://github.com/saltstack-formulas/nifi-formula/commit/5b266c2d7a28fdeb16537dcf4fbac7ce7f05a016))


### Continuous Integration

* **gemfile+lock:** use `ssf` customised `kitchen-docker` repo [skip ci] ([50b8c3e](https://github.com/saltstack-formulas/nifi-formula/commit/50b8c3ea0f4c1428334b27fe07210207f34acb0a))
* **pre-commit:** update hook for `rubocop` [skip ci] ([7d43806](https://github.com/saltstack-formulas/nifi-formula/commit/7d43806e2dbb4c547119c050b61188ef824515af))


### Features

* **formula:** add optional config ([b3bf2dd](https://github.com/saltstack-formulas/nifi-formula/commit/b3bf2dd16773ee717576043c4bf4ae01cbff870c))
* **formula:** check for default setting ([e1bcf20](https://github.com/saltstack-formulas/nifi-formula/commit/e1bcf20fab165905921031206035059a5b8c2ce2))
* **formula:** remove travis ([a778a88](https://github.com/saltstack-formulas/nifi-formula/commit/a778a8842f5915d34b0f03dda2c97420f2924dfa))


### Styles

* **formula:** add line break ([a122966](https://github.com/saltstack-formulas/nifi-formula/commit/a12296657caf962a736d08341552b78675f9681c))
* **formula:** add newline ([63f6a4b](https://github.com/saltstack-formulas/nifi-formula/commit/63f6a4b056c16516a00595f434c39d2895d9a4ac))


### Tests

* **formula:** adjust gitlab ci builds ([37c5b87](https://github.com/saltstack-formulas/nifi-formula/commit/37c5b874fef1678005950247814276d82fc7c6a9))
* **formula:** adjust gitlab ci builds ([f4243ee](https://github.com/saltstack-formulas/nifi-formula/commit/f4243eed29ee07f5b0e3586084f2ef206c582362))
* **formula:** remove fedora ([bb92f10](https://github.com/saltstack-formulas/nifi-formula/commit/bb92f10eabe0b046a0d75d53dceb4d84f91dd5fb))
* add line break ([49bc4f4](https://github.com/saltstack-formulas/nifi-formula/commit/49bc4f4cdc1c82a58ead476bb919999f814697f9))
* **formula:** remove old os ([74a995e](https://github.com/saltstack-formulas/nifi-formula/commit/74a995ef2d98e2a5ae554ebd39e782ffa0b83569))
* **formula:** remove old os travis ([1c17bb7](https://github.com/saltstack-formulas/nifi-formula/commit/1c17bb73b6c9b0083ab17847843287b49679eafc))
* remove test ([37173fa](https://github.com/saltstack-formulas/nifi-formula/commit/37173faa07f49d8a2466d56d60671a5c05a4b4f5))
* testing jinja2 linebreak ([9b51800](https://github.com/saltstack-formulas/nifi-formula/commit/9b51800a107101dff72838d921fbd4c6c2a2064f))

# [0.3.0](https://github.com/saltstack-formulas/nifi-formula/compare/v0.2.0...v0.3.0) (2021-01-13)


### Continuous Integration

* **commitlint:** ensure `upstream/master` uses main repo URL [skip ci] ([6decd0d](https://github.com/saltstack-formulas/nifi-formula/commit/6decd0d595a0fd7a4acd60c8e0391af1d13ae0cc))
* **gitlab-ci:** add `rubocop` linter (with `allow_failure`) [skip ci] ([60938c8](https://github.com/saltstack-formulas/nifi-formula/commit/60938c8ef91018ffa6053f91f0be0b88ff4c922e))


### Features

* **security:** add comment security section ([1627e64](https://github.com/saltstack-formulas/nifi-formula/commit/1627e647555a27456eb92e3ed512d70b0bd4d772))

# [0.2.0](https://github.com/saltstack-formulas/nifi-formula/compare/v0.1.3...v0.2.0) (2020-12-16)


### Continuous Integration

* **gitlab-ci:** use GitLab CI as Travis CI replacement ([c61c13e](https://github.com/saltstack-formulas/nifi-formula/commit/c61c13e6d1e7a1be6a6301741a6520c8305f9283))
* **kitchen:** use `saltimages` Docker Hub where available [skip ci] ([dc1b5dc](https://github.com/saltstack-formulas/nifi-formula/commit/dc1b5dcbf9c8388c5f19a2d0a096537bfa8407b3))
* **kitchen+travis:** add new platforms [skip ci] ([abb0147](https://github.com/saltstack-formulas/nifi-formula/commit/abb0147c69384bb39936347d8c1a39203fe1a5df))
* **kitchen+travis:** adjust matrix to add `3000.2` & remove `2018.3` [skip ci] ([ea539a2](https://github.com/saltstack-formulas/nifi-formula/commit/ea539a2535f952769bed390ebce5796ac1189208))
* **kitchen+travis:** adjust matrix to add `3000.3` [skip ci] ([8768f47](https://github.com/saltstack-formulas/nifi-formula/commit/8768f474a89df4612942c6deefb325bd2e87f24c))
* **pre-commit:** add to formula [skip ci] ([e50e79e](https://github.com/saltstack-formulas/nifi-formula/commit/e50e79eb2c963c5012d4b3606fc9b7879206e0b4))
* **pre-commit:** enable/disable `rstcheck` as relevant [skip ci] ([66f60f6](https://github.com/saltstack-formulas/nifi-formula/commit/66f60f64247afc85ec3c19c0aac59a189e9c8a7e))
* **pre-commit:** finalise `rstcheck` configuration [skip ci] ([7a0aa8c](https://github.com/saltstack-formulas/nifi-formula/commit/7a0aa8c4e604531957d9a2790430bff22682a613))
* **travis:** add notifications => zulip [skip ci] ([1c9f4f0](https://github.com/saltstack-formulas/nifi-formula/commit/1c9f4f0b937864dda99724f4be7a7deb8a4b42e0))
* **workflows/commitlint:** add to repo [skip ci] ([6bb4d47](https://github.com/saltstack-formulas/nifi-formula/commit/6bb4d472b052dd1910853572dd55fab3efe850a2))


### Features

* **defaults:** update version from `1.11.4` => `1.12.1` [skip ci] ([704601a](https://github.com/saltstack-formulas/nifi-formula/commit/704601a5bdb8c00d4cb15e830cbd6a2b5d42d47e))


### Styles

* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] ([135f01a](https://github.com/saltstack-formulas/nifi-formula/commit/135f01a377587f347713d026f3c58538327a245f))

## [0.1.3](https://github.com/saltstack-formulas/nifi-formula/compare/v0.1.2...v0.1.3) (2020-04-08)


### Documentation

* add requirements ([22db68b](https://github.com/saltstack-formulas/nifi-formula/commit/22db68b1bcc9de3d52ca673a073ed4776c6d8c7c))
* update java comment ([7e95255](https://github.com/saltstack-formulas/nifi-formula/commit/7e952554b917ffdf6d8bc3a25b806c3b1c4e74b8))

## [0.1.2](https://github.com/saltstack-formulas/nifi-formula/compare/v0.1.1...v0.1.2) (2020-04-07)


### Bug Fixes

* java path and provenance indexed fields ([2b04bcb](https://github.com/saltstack-formulas/nifi-formula/commit/2b04bcb6ea21454de13d0effe2ac98850c828584))

## [0.1.1](https://github.com/saltstack-formulas/nifi-formula/compare/v0.1.0...v0.1.1) (2020-04-06)


### Documentation

* fix bullet list ([a3286d8](https://github.com/saltstack-formulas/nifi-formula/commit/a3286d81e06c8f36af99c4c1afa33109d30f1bc6))
