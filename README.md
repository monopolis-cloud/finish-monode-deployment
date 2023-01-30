# Monopolis: Finish Monode Rollout

This action is designed to work with Monopolis Monode rollouts workflows only. It finishes a rollout from a GitHub Actions pipeline

## Action inputs
| Name    | Sample value | Description              |
|---------|--------------|--------------------------|
| success | true, false  | Result status of rollout |

## Action outputs
None. These are picked up automatically from the input event which triggered the workflow.

## Example
This example demonstrates the usage.

```yml
name: Example monode rollout

on:
  workflow_dispatch:
    inputs:
      ROLLOUT_ID:
        description: Rollout Id
        required: true
        type: string
jobs:
  deploy:
    runs-on: ubuntu-18.04
    steps:
      - id: finish
        uses: monopolis-cloud/finish-monode-rollout@main
        with:
          success: true
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```