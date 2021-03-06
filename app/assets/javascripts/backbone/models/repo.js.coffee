class Chrysalis.Models.Repo extends Backbone.RelationalModel
  paramRoot: 'repo'

  relations: [
    type: Backbone.HasMany
    key: 'pull_requests'
    relatedModel: 'Chrysalis.Models.PullRequest'
    collectionType: 'Chrysalis.Collections.PullRequestsCollection'
    reverseRelation:
      key: 'repo'
    createModels: true
  ]

  whitelist_attrs: ['name', 'owner', 'token']

  defaults:
    name: null
    owner: null
    token: null
    client_id: null
    client_secret: null
    jira_url: null
    should_provision_mysql: null
    should_provision_nginx: null
    should_provision_redis: null
    nginx_template: null
    redis_template: null
    log_file: null
    jira_username: null
    jira_password: null

Chrysalis.Models.Repo.setup()

class Chrysalis.Collections.ReposCollection extends Backbone.Collection
  model: Chrysalis.Models.Repo
  url: '/repos'
