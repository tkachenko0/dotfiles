#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
ENV_FILE="$DOTFILES_DIR/.env"

if [ ! -f "$ENV_FILE" ]; then
    echo "Missing .env file at $ENV_FILE"
    exit 1
fi

source "$ENV_FILE"

required_vars=(GIT_EMAIL GIT_USERNAME GIT_EMAIL_PERSONAL GIT_USERNAME_PERSONAL)
for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Missing required variable: $var in .env"
        exit 1
    fi
done

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main
git config --global credential.helper store
git config --global pull.rebase true
git config --global commit.template ~/.gitmessage

git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Visual Studio Dark+"
git config --global delta.dark true

# Personal override
git config --global includeIf."gitdir:~/dev/personal/".path ~/.gitconfig-personal
git config --file ~/.gitconfig-personal user.email "$GIT_EMAIL_PERSONAL"
git config --file ~/.gitconfig-personal user.name "$GIT_USERNAME_PERSONAL"

cat <<'EOF' > ~/.gitmessage
feat(scope): summary

#   feat     - new feature
#   fix      - bug fix
#   refactor - code change that neither fixes a bug nor adds a feature
#   perf     - performance improvement
#   test     - adding or fixing tests
#   docs     - documentation only
#   chore    - tooling, config, deps
#   ci       - CI/CD changes
#   build    - build system changes
EOF
