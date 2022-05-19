#!/usr/bin/env bash
set -xe


REMOTE=${REMOTE:-origin}
if [ "$#" -eq 1 ]; then
    YATAI_IMAGE=$1
    VERSION=$1
elif [ "$#" -eq 2 ]; then
    YATAI_IMAGE=$1
    VERSION=$2
else
    echo "Usage: $0 [YATAI_IMAGE] [VERSION]"
    exit 1
fi
echo "Updating Yatai image to $YATAI_IMAGE and version to $VERSION"

GIT_ROOT=$(git rev-parse --show-toplevel)

git checkout main

echo "Updating the value.yaml file with the new Yatai image..."
echo "Updating appVersion and version in Chart.yaml"
if [[ "$OSTYPE" =~ ^darwin && !bash -c "sed --version | grep -q gsed" ]]; then
    # Note
    # for Mac users who get an invalid command code C error... For in-place
    # replacements, BSD sed requires a file extension after the -i flag because it
    # saves a backup file with the given extension. For example: sed -i '.bak'
    # 's/find/replace/' /file.txt You can skip the backup by using an empty
    # string like so: sed -i '' 's/find/replace/' /file.txt –

    sed -i '' "s/^  tag:.*$/  tag: $YATAI_IMAGE/" values.yaml
    sed -i '' "s/^version:.*$/version: $VERSION/" Chart.yaml
    sed -i '' "s/^appVersion:.*$/appVersion: $VERSION/" Chart.yaml
else
    sed -i "s/^  tag:.*$/  tag: $YATAI_IMAGE/" values.yaml
    sed -i "s/^version:.*$/version: $VERSION/" Chart.yaml
    sed -i "s/^appVersion:.*$/appVersion: $VERSION/" Chart.yaml
fi

# Add changed files to git
git add values.yaml Chart.yaml
git commit -m "Update Yatai and Helm version to $VERSION"
git push ${REMOTE} main

tag_name="v$VERSION"

if git rev-parse "$tag_name" >/dev/null 2>&1; then
    echo "Tag $tag_name already exists"
    echo "To overwrite existing tag, run the following command:"
    echo "git tag -d $tag_name && git push --delete ${REMOTE} $tag_name"
    git checkout "$tag_name"
else
    echo "Creating tag $tag_name"
    git tag -a "$tag_name" -m "Tag generated by bentoctl/dev/release.sh, version: $VERSION"
    git push ${REMOTE} "$tag_name"
fi

# generate index.yaml and .tgz file
echo "Package helm chart to .tgz file..."
helm package .

TAR_FILE="yatai-$VERSION.tgz"

# Restore the changes from
git restore values.yaml Chart.yaml
git stash --include-untracked

# Checkout the `artifacthub-io-release` branch
echo "Checking out the artifacthub-io-release branch..."
git checkout artifacthub-io-release
git fetch ${REMOTE} artifacthub-io-release:artifacthub-io-release -r

git stash pop

echo "Re-index helm charts..."
helm repo index .

# commit the changes
echo "Committing the changes..."
# Find the .tgz file name and add it to the commit
git add "$TAR_FILE" index.yaml

# commit the changes
git commit -m "Update Yatai image to $YATAI_IMAGE and Helm chart version to $VERSION"

# push the changes
git push ${REMOTE} artifacthub-io-release

echo "Done!"

