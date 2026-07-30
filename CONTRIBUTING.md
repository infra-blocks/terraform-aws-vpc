# Contribution Guidelines

## Development

### Setup

This project depends on the following tools:
- [tfenv](https://github.com/tfutils/tfenv) to manage its terraform version.
- [make](https://www.gnu.org/software/make/) to automate various build scripts.

Install those, then run the following:
```shell
tfenv install # Will install the version in `.terraform-version` file
```

### Linting

The project enforces linting based on `terraform fmt`. Lint the code by running `make lint`.


### Testing

Refer to terraform's documentation on how to test terraform code. This project exposes a script for testing:
`make test`.

### Release Flow

This project's release cycle is fully automated. It leverages the [git-tag-from-semver-increment-workflow](https://github.com/infra-blocks/git-tag-from-semver-increment-workflow)
to accomplish this. Refer to its documentation for usage information.
