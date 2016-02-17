# Buildkite Dependent Pipeline Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to trigger another build pipeline from within a pipeline using the [Create Build API](https://buildkite.com/docs/api/builds#create-a-build).

There are two example steps:

* [blocking.sh](blocking.sh) - this creates a build and waits for it to finish. The step will pass only if the other build passes.
* [non_blocking.sh](non_blocking.sh) - this creates anoter build and returns a success

## Screenshot

<img src="screenshot.png" alt="Screenshot of a dependent pipeline build" width="454" height="603">

## License

See [Licence.md](Licence.md) (MIT)
