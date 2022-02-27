## Installing Node.js using nvm (Node Version Manager)

### Install nvm using yay

``` bash
$ yay -S nvm
```
### Setup Node Version Manager

- After installing, it's time to add a variable to your bash command.

``` .zshrc
# .zshrc
source /usr/share/nvm/init-nvm.sh
```

## How to install Nodejs using nvm

- To download, compile, and install the latest release of node, run the following command:

``` shell
$ nvm install node
```

- To install a specific "node" version, first list the available node versions and then install the version as shown.

``` shell
$ nvm ls-remote
$ nvm install 16.13.1
or 
$ nvm install --lts
```
- You can check all installed version with the following command:

``` shell
$ nvm ls
```
- To switch to any version installed by nvm.

``` shell
$ nvm use 16.3.1
or 
$ nvm use --lts
```
- Now verify current active version of node.js

``` shell
$ node --version
or 
$ node -v
```
and 

``` shell
$ npm -v
```

## Installing yarn and uses of Yarn Package Manager

### How to install yarn 

- Install `yarn` using npm 

Install `yarn` using npm. The `-g` flag has npm install yarn as a global package, rather than a project package.

``` shell
$ npm install -g yarn
```
- Verify the installation

``` shell
$ yarn --version
or 
$ yarn -v
```
### Install, Remove, and Modify Packages with yarn

- Initialize the new project using yarn

``` shell
$ yarn init
```
- Install a package with yarn 

``` shell
$ yarn add <packageName>
```
For any of the above commands, Yarn updates the` package.json` file with the package information.

- If you are trying to install dependencies for an existing project, with its own `package.json`, run the following command in the base directory:

``` shell
$ yarn install
```
- How to remove a package with yarn 

You can uninstall a Yarn package with the `remove` command. Replace the example package with your own package’s name.

``` shell
$ yarn remove <packageName>
```
As with the add command, Yarn updates the `package.json` to reflect the removed package.

## Installing ReactJs on Arch Linux

### How to install create-react-app

We will install create-react-app using npm. 

``` shell
$ npm install -g create-react-app
```
- Check create-react-app version

``` shell
$ create-react-app --version
```
### Getting Started with create-react-app ---> [Quick Start](https://create-react-app.dev/docs/getting-started/)
