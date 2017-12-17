# Papa [![Version](https://img.shields.io/gem/v/papa.svg?style=flat)](https://rubygems.org/gems/papa) [![Build Status](https://img.shields.io/travis/b-ggs/papa/master.svg?style=flat)](https://travis-ci.org/b-ggs/papa)

Helper tool for inDinero's git workflow. Ako ang papa mo.

## Contents

* [Getting Started](#getting-started)
* [Commands](#commands)
	* [papa release](#papa-release)
	  * [start](#starting-a-release-branch)
	  * [add](#adding-feature-branches-to-a-release-branch)
	  * [finish](#finishing-a-release-branch)
	* [papa hotfix](#papa-hotfix)
	  * [start](#starting-a-hotfix-branch)
	  * [add](#adding-bugfix-branches-to-a-hotfix-branch)
	  * [deploy](#deploying-a-hotfix-branch-to-a-hotfix-environment)
	  * [finish](#finishing-a-hotfix-branch)
	* [papa integration](#papa-integration)
	  * [start](#starting-an-integration-branch)
	  * [add](#adding-branches-to-an-integration-branch)
	  * [deploy](#deploying-an-integration-branch-to-an-integration-environment)
	* [papa sandbox](#papa-sandbox)
	  * [generate](#papa-sandbox)

## Getting Started

Install `papa` from Rubygems.

```
$ gem install papa
```

That's it, you're ready to go!

## Usage

Detailed information about what these commands do can be found in [USAGE.md](https://github.com/b-ggs/papa/blob/master/USAGE.md).

### `papa release`

#### Starting a release branch

```
$ papa release start -v 17.12.0
```

#### Adding feature branches to a release branch

If you want to specify the feature branches using `-b`:

```
$ papa release add -v 17.12.0 -b feature/1 feature/2 feature/3
```

If you want to use vi to specify the feature branches:

```
$ papa release add -v 17.12.0
```

#### Finishing a release branch

```
$ papa release finish -v 17.12.0
```

### `papa hotfix`

#### Starting a hotfix branch

```
$ papa hotfix start -v 17.12.0
```

#### Adding bugfix branches to a hotfix branch


If you want to specify the bugfix branches using `-b`:

```
$ papa hotfix add -v 17.12.0 -b bugfix/1 bugfix/2 bugfix/3
```

If you want to use vi to specify the bugfix branches:

```
$ papa hotfix add -v 17.12.0
```

#### Deploying a hotfix branch to a hotfix environment

```
$ papa hotfix deploy -v 17.12.0
```

#### Finishing a hotfix branch

```
$ papa hotfix finish -v 17.12.0
```

### `papa integration`

#### Starting an integration branch

```
$ papa integration start -f develop
```

#### Adding branches to an integration branch

If you want to specify the feature branches using `-b`:

```
$ papa integration add -v 17.12.0 -b feature/1 feature/2 feature/3
```

If you want to use vi to specify the feature branches:

```
$ papa integration add -v 17.12.0
```

#### Deploying an integration branch to an integration environment

```
$ papa integration deploy -v 17.12.7.18.20.30
```

### `papa sandbox`

```
$ papa sandbox generate
```
