# Buildkite Dependent Pipeline Example

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to trigger another pipeline using [Trigger Steps](https://buildkite.com/docs/pipelines/trigger-step).

👉 **See this example in action:**

- [Test pipeline](https://buildkite.com/buildkite/dependent-pipeline-example/builds/latest?branch=main) — runs tests and triggers the deployment
- [Deployment pipeline](https://buildkite.com/buildkite/dependent-pipeline-example-deploy/builds/latest?branch=main) — triggered by the test pipeline

<a href="https://buildkite.com/buildkite/dependent-pipeline-example/builds/latest?branch=main">
  <img width="2400" alt="Screenshot of the test pipeline build page" src=".buildkite/test-pipeline.png" />
</a>
<p align="left"><i>Test pipeline: runs tests and triggers deployment</i></p>

<a href="https://buildkite.com/buildkite/dependent-pipeline-example-deploy/builds/latest?branch=main">
  <img width="2400" alt="Screenshot of the deployment pipeline build page" src=".buildkite/deployment-pipeline.png" />
</a>
<p align="left"><i>Deployment pipeline: triggered by the test pipeline</i></p>

<!-- docs:start -->

## How it works

This example consists of two separate pipelines:

- The **Test pipeline** runs tests and then uses a [trigger step](https://buildkite.com/docs/pipelines/trigger-step) to trigger the deployment pipeline.
- The **Deployment pipeline** runs independently and can also be triggered manually.

Each pipeline has its own `pipeline.yml`:
- `.buildkite/pipeline.yml` — defines the test pipeline, including the trigger step
- `.buildkite/pipeline.deploy.yml` — defines the deployment pipeline

## Setup

See the full [Getting Started Guide](https://buildkite.com/docs/guides/getting-started) for step-by-step instructions on how to get this running, or try it yourself:

1. **Create the test pipeline**
   Uploads `.buildkite/pipeline.yml` and triggers the deploy pipeline when tests pass:

   [![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new?template=https://github.com/buildkite/dependent-pipeline-example/tree/main/templates/test)

2. **Create the deployment pipeline**
   Runs independently or when triggered by the test pipeline:

   [![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new?template=https://github.com/buildkite/dependent-pipeline-example/tree/main/templates/deploy)

3. **Trigger a build** on the test pipeline to see it in action!

<!-- docs:end -->

## License

See [LICENSE](LICENSE) (MIT)