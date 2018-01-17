require "capistrano/scm/plugin"
require 'rest_client'
require 'json'

class Capistrano::SCM::GitlabChoiceArtifact < Capistrano::SCM::Plugin
  def set_defaults
    set_if_empty :gitlab_choice_artifact_url, ''
    set_if_empty :gitlab_choice_artifact_private_token, ''
    set_if_empty :gitlab_choice_artifact_project, ''
  end

  def define_tasks
    eval_rakefile File.expand_path("../tasks/gitlab_choice_artifact.rake", __FILE__)
  end

  def register_hooks
    after "deploy:new_release_path", "gitlab_choice_artifact:create_release"
  end

  def create_release
    on release_roles :all do
      RestClient.post("http://gitlab.rete.farm/api/v4/projects/#{fetch(:gitlab_choice_artifact_project)}/jobs", "PRIVATE-TOKEN: #{fetch(:gitlab_choice_artifact_private_token)}", :content_type => :json, :accept => :json, :timeout => 5, :open_timeout => 5){ |response, request, result| response
        case response.code
        when 200
          json = JSON.parse(response)
        end
      }
      execute :mkdir, "-p", release_path
      execute :wget, "-q -O #{repo_path}/artifact.zip --header=\"PRIVATE-TOKEN: #{fetch(:gitlab_choice_artifact_private_token)}\" #{fetch(:gitlab_choice_artifact_url)}"
      execute :unzip, "-q #{repo_path}/artifact.zip -d #{fetch(:release_path)}/"
    end
  end

end