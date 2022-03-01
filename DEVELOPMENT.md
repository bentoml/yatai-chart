Chart version and appVersions

- chart version is the version of the chart itself. (It's the `version` field in the `Chart.yaml` file.)
- appVersion is the version of the application contained in the chart. (It's the `appVersion` field in the `Chart.yaml` file.)

Since Yatai chart and templates don't change often. We will use the same version
for both `version` and `appVersion`.


How to release new version of Yatai chart:

1. In Yatai repo, makes a new tag on Github. The same semantic version is also used for the docker image tag.
2. In this repo, run `release.sh` script with the semantic versioni from previous step as the argument.


Run `release.sh` script with docker image tag as the first argument and semantic version as the second argument.

```bash
./release.sh yatai_github_repo_tag
```

