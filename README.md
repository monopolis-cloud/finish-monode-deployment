# Monopolis: Finish Monode Rollout

This action is designed to work with Monopolis Monode rollouts workflows only. It finishes a deployment from a GitHub Actions pipeline

## Action inputs
| Name   | Sample value            | Description                  |
|--------|-------------------------|------------------------------|
| status | success, failure, error | Result status of deployment  |

## Action outputs
None. These are picked up automatically from the input event which triggered the workflow.

## Example
This example demonstrates the usage.

```yml
name: Example monode rollout

on:
  workflow_dispatch:
    inputs:
      deployment_id:
        description: Deployment ID
        required: true
        type: string
jobs:
  deploy:
    runs-on: ubuntu-18.04
    steps:
      - id: finish
        uses: monopolis-cloud/finish-monode-rollout@main
        with:
          status: success
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```