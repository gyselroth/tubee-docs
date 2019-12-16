curl https://raw.githubusercontent.com/gyselroth/tubee/master/CHANGELOG.md > docs/server/changelog.md
curl https://raw.githubusercontent.com/gyselroth/tubee/master/UPGRADE.md > docs/server/upgrade.md
curl https://raw.githubusercontent.com/gyselroth/tubee/master/CONTRIBUTING.md > docs/server/contribute.md
curl https://raw.githubusercontent.com/gyselroth/tubee/master/README.md > docs/server/index.md
curl https://raw.githubusercontent.com/gyselroth/tubee-helm/master/README.md > docs/server/installation-helm.md

curl https://raw.githubusercontent.com/gyselroth/tubee-client-cli/master/CHANGELOG.md > docs/tubectl/changelog.md
curl https://raw.githubusercontent.com/gyselroth/tubee-client-cli/master/UPGRADE.md > docs/tubectl/upgrade.md
curl https://raw.githubusercontent.com/gyselroth/tubee-client-cli/master/CONTRIBUTING.md > docs/tubectl/contribute.md
curl https://raw.githubusercontent.com/gyselroth/tubee-client-cli/master/README.md > docs/tubectl/index.md

curl https://raw.githubusercontent.com/gyselroth/tubee-sdk-typescript-node/master/README.md > docs/sdk/nodejs/index.md

git clone https://github.com/gyselroth/tubee-sdk-php
cp -Rpv tubee-sdk-php/docs/* docs/sdk/php/
rm -rfv tubee-sdk-php

find docs -name \*.md -exec sed 's/\\$/<br\/\>/g' -i {} \;

git commit  -m "docs" .
mkdocs gh-deploy
git checkout gh-pages
git checkout master api/
git add api
git commit -m "merged apidoc" api
git checkout master
git push
