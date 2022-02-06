Chart version and appVersions

- chart version is the version of the chart itself. (It's the `version` field in the `Chart.yaml` file.)
- appVersion is the version of the application contained in the chart. (It's the `appVersion` field in the `Chart.yaml` file.)

Since Yatai chart and templates don't change often. We will use the same version
for both `version` and `appVersion`.


How to release new version of Yatai chart:

1. In Yatai repo, makes a new release on Github. The same semantic version is also used for the docker image tag.
2. In this repo, run `release.sh` script with the semantic versioni from previous step as the argument.

Since, Yatai does not make github release and tag the docker image with the semantic version yet, we will have to manually increase the semantic version in the chart.yaml file.

Run `release.sh` script with docker image tag as the first argument and semantic version as the second argument.

```bash
./release.sh docker_tag_for_yatai semantic_version_for_the_chart
```

