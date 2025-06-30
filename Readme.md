# Buildkite Dependent Pipeline Example

[![Build status](https://badge.buildkite.com/2c51548da4ca2abd88fa2194dbdf46b916c65047ef03786752.svg)](https://buildkite.com/buildkite/dependent-pipeline-example)
[![Add to Buildkite](https://img.shields.io/badge/Add%20to%20Buildkite-14CC80)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to trigger another pipeline using [Triggers Steps](https://buildkite.com/docs/pipelines/trigger-step).

👉 **See this example in action:** [buildkite/dependent-pipeline-example](https://buildkite.com/buildkite/dependent-pipeline-example/builds/latest)

<a href="https://buildkite.com/buildkite/dependent-pipeline-example/builds/latest?branch=main">
  <img width="2400" alt="Screenshot of example pipeline build page" src=".buildkite/screenshot.png" />
</a>

## Getting Started

### 1. Create the test pipeline

The test pipeline uses [.buildkite/pipeline.yml](.buildkite/pipeline.yml) to run the tests and trigger deployment builds on the main branch:

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new?template=https://github.com/buildkite/dependent-pipeline-example/tree/main/templates/test)

### 2. Create the deployment pipeline

The deployment pipeline uses [pipeline.deploy.yml](.buildkite/pipeline.deploy.yml) to perform deployments, and can be run independently of the test pipeline:

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new?template=https://github.com/buildkite/dependent-pipeline-example/tree/main/templates/deploy)

### 3. Run a build on the test pipeline

Once you’ve created the two pipelines, trigger a build on your test pipeline to see it all in action!

## License

See [LICENSE](LICENSE) (MIT)
