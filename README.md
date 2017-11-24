# Papa [![Gem Version](https://badge.fury.io/rb/papa.svg)](https://badge.fury.io/rb/papa) [![Build Status](https://travis-ci.org/b-ggs/papa.svg?branch=master)](https://travis-ci.org/b-ggs/papa) [![Maintainability](https://api.codeclimate.com/v1/badges/cec506e3421dc3e08eeb/maintainability)](https://codeclimate.com/github/b-ggs/papa/maintainability)

Helper tool for inDinero's git workflow. Ako ang papa mo.

## Contents

* [Getting Started](#getting-started)
* [Commands](#commands)
	* [papa release](#papa-release)
	* [papa hotfix](#papa-hotfix)
	* [papa integration](#papa-integration)
	* [papa deploy](#papa-deploy)
	* [papa sandbox](#papa-sandbox)

## Getting Started

Install `papa` from Rubygems.

```
$ gem install papa
```

That's it, you're ready to go!

## Commands

### `papa release`

#### Starting a release branch

This will create a new release branch based on the current `develop` branch. The release branch will be pushed to origin.

```
$ papa release start -v, --version=VERSION
```

###### Sample Usage:

```
$ papa release start -v 17.12.0
```

#### Adding feature branches to a release branch

This will rebase all new feature branches from the release branch and then subsequently merge the updated feature branch into the release branch. The updated release branch will be pushed to origin.

```
$ papa release add -v, --version=VERSION [-b, --feature-branches=one two three]
```

If `--feature-branches` is not specified, it will prompt a vi session where you can enter the branch names separated by line breaks.

##### Sample Usage:

If you want to specify the feature branches using `--feature-branches`:

```
$ papa release add -v 17.12.0 -b feature/1 feature/2 feature/3
```

If you want to use vi to specify the feature branches:

```
$ papa release add -v 17.12.0
```

#### Finishing a release branch

The finished release branch will be merged to `master` and `develop`. The updated `master` and `develop` branches will be pushed to origin.

```
$ papa release finish -v, --version=VERSION
```

##### Sample Usage:

```
$ papa release finish -v 17.12.0
```

### `papa hotfix`

#### Starting a hotfix branch

This will create a new hotfix branch based on the current `master` branch. The hotfix branch will be pushed to origin.

```
$ papa hotfix start -v, --version=VERSION
```

###### Sample Usage:

```
$ papa hotfix start -v 17.12.0
```

#### Adding bugfix branches to a hotfix branch

This will rebase all new bugfix branches from the hotfix branch and then subsequently merge the updated bugfix branch into the release branch. The updated release branch will be pushed to origin.

```
$ papa hotfix add -v, --version=VERSION [-b, --bugfix-branches=one two three]
```

If `--bugfix-branches` is not specified, it will prompt a vi session where you can enter the branch names separated by line breaks.

##### Sample Usage:

If you want to specify the bugfix branches using `--bugfix-branches`:

```
$ papa hotfix add -v 17.12.0 -b bugfix/1 bugfix/2 bugfix/3
```

If you want to use vi to specify the bugfix branches:

```
$ papa hotfix add -v 17.12.0
```

#### Finishing a hotfix branch

The finished hotfix branch will be merged to `master` and `develop`. The updated `master` and `develop` branches will be pushed to origin.

```
$ papa release hotfix -v, --version=VERSION
```

##### Sample Usage:

```
$ papa release hotfix -v 17.12.0
```

### `papa integration`

#### Starting an integration branch

This will create a new integration branch based on the specified base branch. The integration branch will be pushed to origin.

```
$ papa integration start -b, --base-branch=BASE_BRANCH
```

##### Sample Usage:

```
$ papa integration start -b develop
```

### `papa deploy`

### `papa sandbox`

#### Generating a new sandbox

This will generate a git repository that you can use to test out `papa`.

```
$ papa sandbox generate
```