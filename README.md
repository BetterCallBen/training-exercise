## Setup

### Clone the repository

```sh
cd ~/code/YOUR_GITHUB_USERNAME
git clone YOUR_SSH_ADDRESS tree-adoption
cd tree-adoption

```

### Install dependencies using Bundler and Yarn:

```sh
bundle && yarn
```

### Initialize the database

```sh
rake db:create db:migrate
```
