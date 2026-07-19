# conf-ci

Internal shared CI/build workflows for Conf. Product repos call the reusable
workflows here so release/build logic stays in one place.

> Internal repository. Consumed via `uses: ghektestorg/conf-ci/...@main` with
> `secrets: inherit`.

## Workflows

- `reusable-build.yml` — builds a target ref, publishes a preview artifact to
  the internal registry. Authenticates as the **conf-ci** GitHub App to push
  build metadata back to the calling repo.
