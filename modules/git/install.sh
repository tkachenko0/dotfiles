#!/bin/bash

set -e

sudo apt install -y git

if [ -z "$GIT_EMAIL" ]; then
    read -p "Enter your Git email: " git_email
else
    git_email="$GIT_EMAIL"
fi

git config --global user.name v.tkachenko
git config --global user.email $git_email
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
