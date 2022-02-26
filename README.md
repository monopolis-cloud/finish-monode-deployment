# Monopolis: Finish Monode Deployment

This action is designed to work with Monopolis deployment workflows only. It finishes a deployment from a GitHub Actions pipeline

## Action inputs
| Name   | Sample value            | Description                  |
|--------|-------------------------|------------------------------|
| status | success, failure, error | Result status of deployment  |

## Action outputs
None. These are picked up automatically from the input event which triggered the workflow.

## Example
This example demonstrates the usage.

```yml
name: Example monode deployment

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
      - id: finish_monode_deployment
        uses: monopolis-cloud/finish-monode-deployment@main
        with:
          status: success
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```