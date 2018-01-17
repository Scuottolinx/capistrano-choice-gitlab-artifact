# Capistrano::GitlabArtifact

Gitlab Artifact is a [Custom SCM Plugin](http://capistranorb.com/documentation/advanced-features/custom-scm/) for Capistrano v3


## Installation

```
# Gemfile
gem 'capistrano-choice-gitlab-artifact', '0.0.1'
```

## Usage

Require capistrano-choice-gitlab-artifact in your Capfile

```
# Capfile
require "capistrano/scm/gitlab-choice-artifact"
install_plugin Capistrano::SCM::GitlabChoiceArtifact
```


### Settings

```ruby
# Custom "Gitlab Choice Artifact" SCM configuration
set :gitlab_artifact_url, 'https://your.gitlab.com/your-namespace/your-repository/-/jobs/artifacts/gitlab-ci/download?job=build'
set :gitlab_artifact_project, ''
set :gitlab_artifact_private_token, 'your-private-token'
```
