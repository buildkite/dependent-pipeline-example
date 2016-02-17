# Buildkite Dependent Pipeline Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to trigger another build pipeline from within a pipeline using the [Create Build API](https://buildkite.com/docs/api/builds#create-a-build).

There are two example steps:

* [non_blocking.sh](non_blocking.sh) - this creates anoter build and returns a success
* [blocking.sh](blocking.sh) - this creates a build and waits for it to finish. The step will pass only if the other build passes.

## Environment variables

These steps require the following environment variables to be set:

* `TRIGGER_API_ACCESS_TOKEN` - a Buildkite API access token with `write_builds` access
* `TRIGGER_ORG_SLUG` - the slug of the org
* `TRIGGER_PIPELINE_SLUG` - the slug of the pipeline
* `TRIGGER_COMMIT` - the commit for the build (e.g. `HEAD`)
* `TRIGGER_BRANCH` - the branch for the build (e.g. `master`)
* `TRIGGER_MESSAGE` - the message for the build (e.g. `Oh hai :wave:`)

### Screenshot

<img src="screenshot.png" alt="Screenshot of a dependent pipeline build" width="454" height="603">

## License

See [Licence.md](Licence.md) (MIT)
