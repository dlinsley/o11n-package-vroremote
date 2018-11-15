# Concourse - build packages

This concourse pipeline:
 - Tracks a build version in an S3 compatible object store
 - Tracks changes on master branch of this repo
 - Builds .package files
 - Creates a github release with the compiled .package files.
 - Tags the release as pre-release with a version number

This pipeline depends on the following secrets defined in a Concourse integrated CredHub or Vault:
 - /concourse/`team name`/s3-access-key
 - /concourse/`team name`/s3-secret-key
 - /concourse/`team name`/s3-endpoint
 - /concourse/`team name`/github-access-token
 - /concourse/`team name`/harbor-host
 - /concourse/`team name`/harbor-user.username
 - /concourse/`team name`/harbor-user.password

`team name` is typically main


It depends on a docker container that is ready to execute maven for creating orchestrator .package files.  See https://github.com/dlinsley/docker-o11n-maven for details on creating one.
