# Buildkite Dependent Pipeline Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) that shows how to trigger another dependent build pipeline using the [Create Build API](https://buildkite.com/docs/api/builds#create-a-build), both asynchronously (its build status will not affect this build) and synchronously (its build status will affect this build).

Files to note:

* [.buildkite/pipeline.yml](.buildkite/pipeline.yml) - the basic pipeline configuration
* [trigger_async.sh](trigger.sh) - triggers another build pipeline
* [trigger_sync.sh](trigger_and_wait.sh) - triggers another build pipeline and waits until it succeeds

## License

See [Licence.md](Licence.md) (MIT)
