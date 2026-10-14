# frozen_string_literal: true

module Anthropic
  module Internal
    # @api private
    #
    # @generic Elem
    #
    # What a streaming method returns when its API call has a recording span. Reading
    # or closing it reads or closes the SDK's own stream, and ends the span.
    class TracedStream
      include Anthropic::Internal::Type::BaseStream

      # What a recorder that follows this stream has read of it.
      # @return [Object, nil]
      attr_reader :streamed_message

      # @api private
      #
      # @param stream [Anthropic::Internal::Type::BaseStream] the SDK's own stream
      #
      # @param iterator [Enumerable<generic<Elem>>] reads `stream`, and ends the span
      #
      # @param streamed_message [Object, nil]
      def initialize(stream, iterator, streamed_message)
        @model = stream.instance_variable_get(:@model)
        @status = stream.status
        @headers = stream.headers
        @iterator = iterator
        @streamed_message = streamed_message
      end
    end

    # @api private
    #
    # One `CLIENT` span per API call: every retry of an SDK method's request, and
    # reading the stream it returns. The SDK emits no span per HTTP attempt.
    module Tracing
      INSTRUMENTATION_SCOPE = "com.anthropic.sdk.ruby"

      ERROR_TYPE = "error.type"
      HTTP_REQUEST_METHOD = "http.request.method"
      HTTP_REQUEST_RESEND_COUNT = "http.request.resend_count"
      HTTP_RESPONSE_STATUS_CODE = "http.response.status_code"
      HTTP_ROUTE = "http.route"
      SERVER_ADDRESS = "server.address"
      SERVER_PORT = "server.port"
      URL_FULL = "url.full"
      URL_PATH = "url.path"
      URL_QUERY = "url.query"
      URL_SCHEME = "url.scheme"

      GEN_AI_PROVIDER_NAME = "gen_ai.provider.name"
      ANTHROPIC_REQUEST_ID = "anthropic.request.id"
      ANTHROPIC_ORGANIZATION_ID = "anthropic.organization.id"
      ANTHROPIC_WORKSPACE_ID = "anthropic.workspace.id"
      GEN_AI_OPERATION_NAME = "gen_ai.operation.name"
      GEN_AI_REQUEST_MODEL = "gen_ai.request.model"
      GEN_AI_REQUEST_MAX_TOKENS = "gen_ai.request.max_tokens"
      GEN_AI_REQUEST_TEMPERATURE = "gen_ai.request.temperature"
      GEN_AI_REQUEST_TOP_P = "gen_ai.request.top_p"
      GEN_AI_REQUEST_TOP_K = "gen_ai.request.top_k"
      GEN_AI_REQUEST_REASONING_LEVEL = "gen_ai.request.reasoning.level"
      ANTHROPIC_REQUEST_SERVICE_TIER = "anthropic.request.service_tier"
      ANTHROPIC_THINKING_TYPE = "anthropic.thinking.type"
      ANTHROPIC_THINKING_BUDGET_TOKENS = "anthropic.thinking.budget_tokens"
      ANTHROPIC_BETA = "anthropic.beta"
      GEN_AI_REQUEST_STREAM = "gen_ai.request.stream"
      GEN_AI_RESPONSE_ID = "gen_ai.response.id"
      GEN_AI_RESPONSE_MODEL = "gen_ai.response.model"
      GEN_AI_USAGE_CACHE_WRITE_INPUT_TOKENS = "gen_ai.usage.cache_write.input_tokens"
      GEN_AI_USAGE_CACHE_READ_INPUT_TOKENS = "gen_ai.usage.cache_read.input_tokens"
      ANTHROPIC_USAGE_CACHE_CREATION_EPHEMERAL_5M_INPUT_TOKENS =
        "anthropic.usage.cache_creation.ephemeral_5m_input_tokens"
      ANTHROPIC_USAGE_CACHE_CREATION_EPHEMERAL_1H_INPUT_TOKENS =
        "anthropic.usage.cache_creation.ephemeral_1h_input_tokens"
      ANTHROPIC_RESPONSE_SERVICE_TIER = "anthropic.response.service_tier"
      GEN_AI_USAGE_OUTPUT_TOKENS = "gen_ai.usage.output_tokens"
      GEN_AI_USAGE_REASONING_OUTPUT_TOKENS = "gen_ai.usage.reasoning.output_tokens"
      ANTHROPIC_MESSAGE_STOP_REASON = "anthropic.message.stop_reason"
      ANTHROPIC_MESSAGE_COUNT_TOKENS_INPUT_TOKENS = "anthropic.message.count_tokens.input_tokens"
      ANTHROPIC_SESSION_ENVIRONMENT_ID = "anthropic.session.environment.id"
      GEN_AI_AGENT_NAME = "gen_ai.agent.name"

      # @api private
      #
      # The span name of each SDK method. Code that names a span through these fails to
      # load once no method has the name.
      module SpanName
        COMPLETIONS_CREATE = "anthropic.completions.create"
        MESSAGES_CREATE = "anthropic.messages.create"
        MESSAGES_COUNT_TOKENS = "anthropic.messages.count_tokens"
        MESSAGES_BATCHES_CREATE = "anthropic.messages.batches.create"
        MESSAGES_BATCHES_RETRIEVE = "anthropic.messages.batches.retrieve"
        MESSAGES_BATCHES_LIST = "anthropic.messages.batches.list"
        MESSAGES_BATCHES_DELETE = "anthropic.messages.batches.delete"
        MESSAGES_BATCHES_CANCEL = "anthropic.messages.batches.cancel"
        MESSAGES_BATCHES_RESULTS = "anthropic.messages.batches.results"
        MODELS_RETRIEVE = "anthropic.models.retrieve"
        MODELS_LIST = "anthropic.models.list"
        FILES_LIST = "anthropic.files.list"
        FILES_DELETE = "anthropic.files.delete"
        FILES_DOWNLOAD = "anthropic.files.download"
        FILES_RETRIEVE_METADATA = "anthropic.files.retrieve_metadata"
        FILES_UPLOAD = "anthropic.files.upload"
        SKILLS_CREATE = "anthropic.skills.create"
        SKILLS_RETRIEVE = "anthropic.skills.retrieve"
        SKILLS_LIST = "anthropic.skills.list"
        SKILLS_DELETE = "anthropic.skills.delete"
        SKILLS_VERSIONS_CREATE = "anthropic.skills.versions.create"
        SKILLS_VERSIONS_RETRIEVE = "anthropic.skills.versions.retrieve"
        SKILLS_VERSIONS_LIST = "anthropic.skills.versions.list"
        SKILLS_VERSIONS_DELETE = "anthropic.skills.versions.delete"
        ORGANIZATION_RETRIEVE = "anthropic.organization.retrieve"
        ORGANIZATION_API_KEYS_RETRIEVE = "anthropic.organization.api_keys.retrieve"
        ORGANIZATION_API_KEYS_UPDATE = "anthropic.organization.api_keys.update"
        ORGANIZATION_API_KEYS_LIST = "anthropic.organization.api_keys.list"
        ORGANIZATION_EXTERNAL_KEYS_CREATE = "anthropic.organization.external_keys.create"
        ORGANIZATION_EXTERNAL_KEYS_RETRIEVE = "anthropic.organization.external_keys.retrieve"
        ORGANIZATION_EXTERNAL_KEYS_UPDATE = "anthropic.organization.external_keys.update"
        ORGANIZATION_EXTERNAL_KEYS_LIST = "anthropic.organization.external_keys.list"
        ORGANIZATION_EXTERNAL_KEYS_DELETE = "anthropic.organization.external_keys.delete"
        ORGANIZATION_EXTERNAL_KEYS_VALIDATE = "anthropic.organization.external_keys.validate"
        ORGANIZATION_FEDERATION_ISSUERS_CREATE = "anthropic.organization.federation.issuers.create"
        ORGANIZATION_FEDERATION_ISSUERS_RETRIEVE = "anthropic.organization.federation.issuers.retrieve"
        ORGANIZATION_FEDERATION_ISSUERS_UPDATE = "anthropic.organization.federation.issuers.update"
        ORGANIZATION_FEDERATION_ISSUERS_LIST = "anthropic.organization.federation.issuers.list"
        ORGANIZATION_FEDERATION_ISSUERS_ARCHIVE = "anthropic.organization.federation.issuers.archive"
        ORGANIZATION_FEDERATION_RULES_CREATE = "anthropic.organization.federation.rules.create"
        ORGANIZATION_FEDERATION_RULES_RETRIEVE = "anthropic.organization.federation.rules.retrieve"
        ORGANIZATION_FEDERATION_RULES_UPDATE = "anthropic.organization.federation.rules.update"
        ORGANIZATION_FEDERATION_RULES_LIST = "anthropic.organization.federation.rules.list"
        ORGANIZATION_FEDERATION_RULES_ARCHIVE = "anthropic.organization.federation.rules.archive"
        ORGANIZATION_FEDERATION_RULES_WORKSPACES_LIST = "anthropic.organization.federation.rules.workspaces.list"
        ORGANIZATION_FEDERATION_RULES_WORKSPACES_ADD = "anthropic.organization.federation.rules.workspaces.add"
        ORGANIZATION_FEDERATION_RULES_WORKSPACES_REMOVE =
          "anthropic.organization.federation.rules.workspaces.remove"
        ORGANIZATION_INVITES_CREATE = "anthropic.organization.invites.create"
        ORGANIZATION_INVITES_RETRIEVE = "anthropic.organization.invites.retrieve"
        ORGANIZATION_INVITES_LIST = "anthropic.organization.invites.list"
        ORGANIZATION_INVITES_DELETE = "anthropic.organization.invites.delete"
        ORGANIZATION_SERVICE_ACCOUNTS_CREATE = "anthropic.organization.service_accounts.create"
        ORGANIZATION_SERVICE_ACCOUNTS_RETRIEVE = "anthropic.organization.service_accounts.retrieve"
        ORGANIZATION_SERVICE_ACCOUNTS_UPDATE = "anthropic.organization.service_accounts.update"
        ORGANIZATION_SERVICE_ACCOUNTS_LIST = "anthropic.organization.service_accounts.list"
        ORGANIZATION_SERVICE_ACCOUNTS_ARCHIVE = "anthropic.organization.service_accounts.archive"
        ORGANIZATION_SERVICE_ACCOUNTS_WORKSPACES_LIST = "anthropic.organization.service_accounts.workspaces.list"
        ORGANIZATION_SERVICE_ACCOUNTS_WORKSPACES_ADD = "anthropic.organization.service_accounts.workspaces.add"
        ORGANIZATION_SERVICE_ACCOUNTS_WORKSPACES_REMOVE =
          "anthropic.organization.service_accounts.workspaces.remove"
        ORGANIZATION_USERS_RETRIEVE = "anthropic.organization.users.retrieve"
        ORGANIZATION_USERS_UPDATE = "anthropic.organization.users.update"
        ORGANIZATION_USERS_LIST = "anthropic.organization.users.list"
        ORGANIZATION_USERS_REMOVE = "anthropic.organization.users.remove"
        ORGANIZATION_WORKSPACES_CREATE = "anthropic.organization.workspaces.create"
        ORGANIZATION_WORKSPACES_RETRIEVE = "anthropic.organization.workspaces.retrieve"
        ORGANIZATION_WORKSPACES_UPDATE = "anthropic.organization.workspaces.update"
        ORGANIZATION_WORKSPACES_LIST = "anthropic.organization.workspaces.list"
        ORGANIZATION_WORKSPACES_ARCHIVE = "anthropic.organization.workspaces.archive"
        ORGANIZATION_WORKSPACES_RATE_LIMITS_LIST = "anthropic.organization.workspaces.rate_limits.list"
        ORGANIZATION_WORKSPACES_MEMBERS_RETRIEVE = "anthropic.organization.workspaces.members.retrieve"
        ORGANIZATION_WORKSPACES_MEMBERS_UPDATE = "anthropic.organization.workspaces.members.update"
        ORGANIZATION_WORKSPACES_MEMBERS_LIST = "anthropic.organization.workspaces.members.list"
        ORGANIZATION_WORKSPACES_MEMBERS_ADD = "anthropic.organization.workspaces.members.add"
        ORGANIZATION_WORKSPACES_MEMBERS_REMOVE = "anthropic.organization.workspaces.members.remove"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_RETRIEVE =
          "anthropic.organization.workspaces.service_accounts.retrieve"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_UPDATE =
          "anthropic.organization.workspaces.service_accounts.update"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_LIST = "anthropic.organization.workspaces.service_accounts.list"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_ADD = "anthropic.organization.workspaces.service_accounts.add"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_REMOVE =
          "anthropic.organization.workspaces.service_accounts.remove"
        ORGANIZATION_RATE_LIMITS_LIST = "anthropic.organization.rate_limits.list"
        ORGANIZATION_COMPLIANCE_SETTINGS_RETRIEVE = "anthropic.organization.compliance_settings.retrieve"
        ORGANIZATION_COMPLIANCE_SETTINGS_UPDATE = "anthropic.organization.compliance_settings.update"
        AGENTS_CREATE = "anthropic.agents.create"
        AGENTS_RETRIEVE = "anthropic.agents.retrieve"
        AGENTS_UPDATE = "anthropic.agents.update"
        AGENTS_LIST = "anthropic.agents.list"
        AGENTS_ARCHIVE = "anthropic.agents.archive"
        AGENTS_VERSIONS_LIST = "anthropic.agents.versions.list"
        ENVIRONMENTS_CREATE = "anthropic.environments.create"
        ENVIRONMENTS_RETRIEVE = "anthropic.environments.retrieve"
        ENVIRONMENTS_UPDATE = "anthropic.environments.update"
        ENVIRONMENTS_LIST = "anthropic.environments.list"
        ENVIRONMENTS_DELETE = "anthropic.environments.delete"
        ENVIRONMENTS_ARCHIVE = "anthropic.environments.archive"
        ENVIRONMENTS_WORK_RETRIEVE = "anthropic.environments.work.retrieve"
        ENVIRONMENTS_WORK_UPDATE = "anthropic.environments.work.update"
        ENVIRONMENTS_WORK_LIST = "anthropic.environments.work.list"
        ENVIRONMENTS_WORK_ACK = "anthropic.environments.work.ack"
        ENVIRONMENTS_WORK_HEARTBEAT = "anthropic.environments.work.heartbeat"
        ENVIRONMENTS_WORK_POLL = "anthropic.environments.work.poll"
        ENVIRONMENTS_WORK_STATS = "anthropic.environments.work.stats"
        ENVIRONMENTS_WORK_STOP = "anthropic.environments.work.stop"
        SESSIONS_CREATE = "anthropic.sessions.create"
        SESSIONS_RETRIEVE = "anthropic.sessions.retrieve"
        SESSIONS_UPDATE = "anthropic.sessions.update"
        SESSIONS_LIST = "anthropic.sessions.list"
        SESSIONS_DELETE = "anthropic.sessions.delete"
        SESSIONS_ARCHIVE = "anthropic.sessions.archive"
        SESSIONS_EVENTS_LIST = "anthropic.sessions.events.list"
        SESSIONS_EVENTS_SEND = "anthropic.sessions.events.send"
        SESSIONS_EVENTS_STREAM = "anthropic.sessions.events.stream"
        SESSIONS_RESOURCES_RETRIEVE = "anthropic.sessions.resources.retrieve"
        SESSIONS_RESOURCES_UPDATE = "anthropic.sessions.resources.update"
        SESSIONS_RESOURCES_LIST = "anthropic.sessions.resources.list"
        SESSIONS_RESOURCES_DELETE = "anthropic.sessions.resources.delete"
        SESSIONS_RESOURCES_ADD = "anthropic.sessions.resources.add"
        SESSIONS_THREADS_RETRIEVE = "anthropic.sessions.threads.retrieve"
        SESSIONS_THREADS_LIST = "anthropic.sessions.threads.list"
        SESSIONS_THREADS_ARCHIVE = "anthropic.sessions.threads.archive"
        SESSIONS_THREADS_EVENTS_LIST = "anthropic.sessions.threads.events.list"
        SESSIONS_THREADS_EVENTS_STREAM = "anthropic.sessions.threads.events.stream"
        DEPLOYMENTS_CREATE = "anthropic.deployments.create"
        DEPLOYMENTS_RETRIEVE = "anthropic.deployments.retrieve"
        DEPLOYMENTS_UPDATE = "anthropic.deployments.update"
        DEPLOYMENTS_LIST = "anthropic.deployments.list"
        DEPLOYMENTS_ARCHIVE = "anthropic.deployments.archive"
        DEPLOYMENTS_PAUSE = "anthropic.deployments.pause"
        DEPLOYMENTS_RUN = "anthropic.deployments.run"
        DEPLOYMENTS_UNPAUSE = "anthropic.deployments.unpause"
        DEPLOYMENT_RUNS_RETRIEVE = "anthropic.deployment_runs.retrieve"
        DEPLOYMENT_RUNS_LIST = "anthropic.deployment_runs.list"
        VAULTS_CREATE = "anthropic.vaults.create"
        VAULTS_RETRIEVE = "anthropic.vaults.retrieve"
        VAULTS_UPDATE = "anthropic.vaults.update"
        VAULTS_LIST = "anthropic.vaults.list"
        VAULTS_DELETE = "anthropic.vaults.delete"
        VAULTS_ARCHIVE = "anthropic.vaults.archive"
        VAULTS_CREDENTIALS_CREATE = "anthropic.vaults.credentials.create"
        VAULTS_CREDENTIALS_RETRIEVE = "anthropic.vaults.credentials.retrieve"
        VAULTS_CREDENTIALS_UPDATE = "anthropic.vaults.credentials.update"
        VAULTS_CREDENTIALS_LIST = "anthropic.vaults.credentials.list"
        VAULTS_CREDENTIALS_DELETE = "anthropic.vaults.credentials.delete"
        VAULTS_CREDENTIALS_ARCHIVE = "anthropic.vaults.credentials.archive"
        VAULTS_CREDENTIALS_MCP_OAUTH_VALIDATE = "anthropic.vaults.credentials.mcp_oauth_validate"
        MEMORY_STORES_CREATE = "anthropic.memory_stores.create"
        MEMORY_STORES_RETRIEVE = "anthropic.memory_stores.retrieve"
        MEMORY_STORES_UPDATE = "anthropic.memory_stores.update"
        MEMORY_STORES_LIST = "anthropic.memory_stores.list"
        MEMORY_STORES_DELETE = "anthropic.memory_stores.delete"
        MEMORY_STORES_ARCHIVE = "anthropic.memory_stores.archive"
        MEMORY_STORES_MEMORIES_CREATE = "anthropic.memory_stores.memories.create"
        MEMORY_STORES_MEMORIES_RETRIEVE = "anthropic.memory_stores.memories.retrieve"
        MEMORY_STORES_MEMORIES_UPDATE = "anthropic.memory_stores.memories.update"
        MEMORY_STORES_MEMORIES_LIST = "anthropic.memory_stores.memories.list"
        MEMORY_STORES_MEMORIES_DELETE = "anthropic.memory_stores.memories.delete"
        MEMORY_STORES_MEMORY_VERSIONS_RETRIEVE = "anthropic.memory_stores.memory_versions.retrieve"
        MEMORY_STORES_MEMORY_VERSIONS_LIST = "anthropic.memory_stores.memory_versions.list"
        MEMORY_STORES_MEMORY_VERSIONS_REDACT = "anthropic.memory_stores.memory_versions.redact"
        SKILLS_VERSIONS_DOWNLOAD = "anthropic.skills.versions.download"
        USER_PROFILES_CREATE = "anthropic.user_profiles.create"
        USER_PROFILES_RETRIEVE = "anthropic.user_profiles.retrieve"
        USER_PROFILES_UPDATE = "anthropic.user_profiles.update"
        USER_PROFILES_LIST = "anthropic.user_profiles.list"
        USER_PROFILES_CREATE_ENROLLMENT_URL = "anthropic.user_profiles.create_enrollment_url"
        DREAMS_CREATE = "anthropic.dreams.create"
        DREAMS_RETRIEVE = "anthropic.dreams.retrieve"
        DREAMS_LIST = "anthropic.dreams.list"
        DREAMS_ARCHIVE = "anthropic.dreams.archive"
        DREAMS_CANCEL = "anthropic.dreams.cancel"
        TUNNELS_CREATE = "anthropic.tunnels.create"
        TUNNELS_RETRIEVE = "anthropic.tunnels.retrieve"
        TUNNELS_LIST = "anthropic.tunnels.list"
        TUNNELS_ARCHIVE = "anthropic.tunnels.archive"
        TUNNELS_REVEAL_TOKEN = "anthropic.tunnels.reveal_token"
        TUNNELS_ROTATE_TOKEN = "anthropic.tunnels.rotate_token"
        TUNNELS_CERTIFICATES_CREATE = "anthropic.tunnels.certificates.create"
        TUNNELS_CERTIFICATES_RETRIEVE = "anthropic.tunnels.certificates.retrieve"
        TUNNELS_CERTIFICATES_LIST = "anthropic.tunnels.certificates.list"
        TUNNELS_CERTIFICATES_ARCHIVE = "anthropic.tunnels.certificates.archive"
        ORGANIZATION_ANALYTICS_SUMMARIES_LIST = "anthropic.organization.analytics.summaries.list"
        ORGANIZATION_ANALYTICS_USERS_LIST = "anthropic.organization.analytics.users.list"
        ORGANIZATION_ANALYTICS_APPS_CHAT_PROJECTS_LIST =
          "anthropic.organization.analytics.apps.chat.projects.list"
        ORGANIZATION_ANALYTICS_CONNECTORS_LIST = "anthropic.organization.analytics.connectors.list"
        ORGANIZATION_ANALYTICS_PLUGINS_LIST = "anthropic.organization.analytics.plugins.list"
        ORGANIZATION_ANALYTICS_SKILLS_LIST = "anthropic.organization.analytics.skills.list"
        ORGANIZATION_ANALYTICS_ARTIFACTS_LIST = "anthropic.organization.analytics.artifacts.list"
        ORGANIZATION_ANALYTICS_USAGE_REPORT_LIST = "anthropic.organization.analytics.usage_report.list"
        ORGANIZATION_ANALYTICS_USER_USAGE_REPORT_LIST = "anthropic.organization.analytics.user_usage_report.list"
        ORGANIZATION_ANALYTICS_COST_REPORT_LIST = "anthropic.organization.analytics.cost_report.list"
        ORGANIZATION_ANALYTICS_USER_COST_REPORT_LIST = "anthropic.organization.analytics.user_cost_report.list"
        ORGANIZATION_SPEND_LIMITS_RETRIEVE = "anthropic.organization.spend_limits.retrieve"
        ORGANIZATION_SPEND_LIMITS_LIST = "anthropic.organization.spend_limits.list"
        ORGANIZATION_SPEND_LIMITS_DELETE = "anthropic.organization.spend_limits.delete"
        ORGANIZATION_SPEND_LIMITS_SET = "anthropic.organization.spend_limits.set"
        ORGANIZATION_SPEND_LIMITS_EFFECTIVE_LIST = "anthropic.organization.spend_limits.effective.list"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_RETRIEVE =
          "anthropic.organization.spend_limits.increase_requests.retrieve"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_LIST =
          "anthropic.organization.spend_limits.increase_requests.list"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_APPROVE =
          "anthropic.organization.spend_limits.increase_requests.approve"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_DENY =
          "anthropic.organization.spend_limits.increase_requests.deny"
        ORGANIZATION_RBAC_GROUPS_CREATE = "anthropic.organization.rbac_groups.create"
        ORGANIZATION_RBAC_GROUPS_RETRIEVE = "anthropic.organization.rbac_groups.retrieve"
        ORGANIZATION_RBAC_GROUPS_UPDATE = "anthropic.organization.rbac_groups.update"
        ORGANIZATION_RBAC_GROUPS_LIST = "anthropic.organization.rbac_groups.list"
        ORGANIZATION_RBAC_GROUPS_DELETE = "anthropic.organization.rbac_groups.delete"
        ORGANIZATION_RBAC_GROUPS_MEMBERS_LIST = "anthropic.organization.rbac_groups.members.list"
        ORGANIZATION_RBAC_GROUPS_MEMBERS_ADD = "anthropic.organization.rbac_groups.members.add"
        ORGANIZATION_RBAC_GROUPS_MEMBERS_REMOVE = "anthropic.organization.rbac_groups.members.remove"
        ORGANIZATION_RBAC_ROLES_RETRIEVE = "anthropic.organization.rbac_roles.retrieve"
        ORGANIZATION_RBAC_ROLES_LIST = "anthropic.organization.rbac_roles.list"
        ORGANIZATION_RBAC_ROLES_PERMISSIONS_LIST = "anthropic.organization.rbac_roles.permissions.list"
        ORGANIZATION_PLUGINS_CREATE = "anthropic.organization.plugins.create"
        ORGANIZATION_PLUGINS_RETRIEVE = "anthropic.organization.plugins.retrieve"
        ORGANIZATION_PLUGINS_UPDATE = "anthropic.organization.plugins.update"
        ORGANIZATION_PLUGINS_LIST = "anthropic.organization.plugins.list"
        ORGANIZATION_PLUGINS_DELETE = "anthropic.organization.plugins.delete"
        ORGANIZATION_PLUGINS_VERSIONS_CREATE = "anthropic.organization.plugins.versions.create"
        ORGANIZATION_PLUGINS_VERSIONS_RETRIEVE = "anthropic.organization.plugins.versions.retrieve"
        ORGANIZATION_PLUGINS_VERSIONS_LIST = "anthropic.organization.plugins.versions.list"
        ORGANIZATION_PLUGINS_VERSIONS_DOWNLOAD = "anthropic.organization.plugins.versions.download"
        ORGANIZATION_PLUGINS_INSTALLATION_SETTINGS_LIST =
          "anthropic.organization.plugins.installation_settings.list"
        ORGANIZATION_PLUGINS_INSTALLATION_SETTINGS_REMOVE =
          "anthropic.organization.plugins.installation_settings.remove"
        ORGANIZATION_PLUGINS_INSTALLATION_SETTINGS_SET =
          "anthropic.organization.plugins.installation_settings.set"
        ORGANIZATION_PLUGINS_SHARES_LIST = "anthropic.organization.plugins.shares.list"
        ORGANIZATION_PLUGIN_MARKETPLACES_RETRIEVE = "anthropic.organization.plugin_marketplaces.retrieve"
        ORGANIZATION_PLUGIN_MARKETPLACES_UPDATE = "anthropic.organization.plugin_marketplaces.update"
        ORGANIZATION_PLUGIN_MARKETPLACES_LIST = "anthropic.organization.plugin_marketplaces.list"
        ORGANIZATION_PLUGIN_MARKETPLACES_VALIDATE_ARCHIVE =
          "anthropic.organization.plugin_marketplaces.validate_archive"
        ORGANIZATION_PLUGIN_MARKETPLACES_VALIDATE_REPOSITORY =
          "anthropic.organization.plugin_marketplaces.validate_repository"
        ORGANIZATION_TELEMETRY_DESTINATIONS_CREATE = "anthropic.organization.telemetry_destinations.create"
        ORGANIZATION_TELEMETRY_DESTINATIONS_RETRIEVE = "anthropic.organization.telemetry_destinations.retrieve"
        ORGANIZATION_TELEMETRY_DESTINATIONS_UPDATE = "anthropic.organization.telemetry_destinations.update"
        ORGANIZATION_TELEMETRY_DESTINATIONS_LIST = "anthropic.organization.telemetry_destinations.list"
        ORGANIZATION_TELEMETRY_DESTINATIONS_DELETE = "anthropic.organization.telemetry_destinations.delete"
        ORGANIZATION_TELEMETRY_DESTINATIONS_TEST = "anthropic.organization.telemetry_destinations.test"
        ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_LIST =
          "anthropic.organization.telemetry_destinations.workspaces.list"
        ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_ADD =
          "anthropic.organization.telemetry_destinations.workspaces.add"
        ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_REMOVE =
          "anthropic.organization.telemetry_destinations.workspaces.remove"
      end

      # @type [Hash{String=>String}]
      CLIENT_ATTRIBUTES = {GEN_AI_PROVIDER_NAME => "anthropic"}.freeze

      # @type [Hash{String=>String}]
      #
      # Each attribute with the response header it comes from.
      RESPONSE_HEADER_ATTRIBUTES =
        {
          ANTHROPIC_REQUEST_ID => "request-id",
          ANTHROPIC_ORGANIZATION_ID => "anthropic-organization-id",
          ANTHROPIC_WORKSPACE_ID => "anthropic-workspace-id"
        }.freeze

      # @type [Array<Symbol>]
      CLIENT_OPTION_KEYS = [:tracer_provider, :propagation, :traces].freeze

      # @type [Array<Symbol>]
      TRACES_KEYS = [:enabled, :content_mode, :max_content_bytes].freeze

      # @type [Array<Symbol>]
      CONTENT_MODES = [:metadata_only, :content].freeze

      # The most bytes the `content` attributes of one span hold when
      # `max_content_bytes` sets no other bound.
      DEFAULT_MAX_CONTENT_BYTES = 750_000

      # @type [Array<Symbol>]
      REQUEST_OPTION_KEYS = [:conversation_id].freeze

      # @type [Array<String>]
      #
      # Query parameters whose value is content on every endpoint that defines them.
      CONTENT_QUERY_PARAMETERS = %w[email path_prefix expected_content_sha256].freeze

      # @type [Hash{String=>Hash{Symbol=>Object}}]
      #
      # By span name. `:request` and `:response` map an attribute to `[path, type]` in
      # that body, `:request_headers` to `[header, type]`.
      SPAN_ATTRIBUTES =
        {
          SpanName::MESSAGES_CREATE => {
            constants: {
              GEN_AI_OPERATION_NAME => "chat"
            },
            request: {
              GEN_AI_REQUEST_MODEL => [[:model], :string],
              GEN_AI_REQUEST_MAX_TOKENS => [[:max_tokens], :integer],
              GEN_AI_REQUEST_TEMPERATURE => [[:temperature], :number],
              GEN_AI_REQUEST_TOP_P => [[:top_p], :number],
              GEN_AI_REQUEST_TOP_K => [[:top_k], :integer],
              GEN_AI_REQUEST_REASONING_LEVEL => [[:output_config, :effort], :string],
              ANTHROPIC_REQUEST_SERVICE_TIER => [[:service_tier], :string],
              ANTHROPIC_THINKING_TYPE => [[:thinking, :type], :string],
              ANTHROPIC_THINKING_BUDGET_TOKENS => [[:thinking, :budget_tokens], :integer]
            },
            request_headers: {
              ANTHROPIC_BETA => ["anthropic-beta", [:string]]
            },
            stream: GEN_AI_REQUEST_STREAM,
            response: {
              GEN_AI_RESPONSE_ID => [[:id], :string],
              GEN_AI_RESPONSE_MODEL => [[:model], :string],
              GEN_AI_USAGE_CACHE_WRITE_INPUT_TOKENS => [[:usage, :cache_creation_input_tokens], :integer],
              GEN_AI_USAGE_CACHE_READ_INPUT_TOKENS => [[:usage, :cache_read_input_tokens], :integer],
              ANTHROPIC_USAGE_CACHE_CREATION_EPHEMERAL_5M_INPUT_TOKENS => [
                [:usage, :cache_creation, :ephemeral_5m_input_tokens], :integer
              ],
              ANTHROPIC_USAGE_CACHE_CREATION_EPHEMERAL_1H_INPUT_TOKENS => [
                [:usage, :cache_creation, :ephemeral_1h_input_tokens], :integer
              ],
              ANTHROPIC_RESPONSE_SERVICE_TIER => [[:usage, :service_tier], :string],
              GEN_AI_USAGE_OUTPUT_TOKENS => [[:usage, :output_tokens], :integer],
              GEN_AI_USAGE_REASONING_OUTPUT_TOKENS => [
                [:usage, :output_tokens_details, :thinking_tokens],
                :integer
              ],
              ANTHROPIC_MESSAGE_STOP_REASON => [[:stop_reason], :string]
            }
          },
          SpanName::MESSAGES_COUNT_TOKENS => {
            request: {
              GEN_AI_REQUEST_MODEL => [[:model], :string]
            },
            response: {
              ANTHROPIC_MESSAGE_COUNT_TOKENS_INPUT_TOKENS => [[:input_tokens], :integer]
            }
          },
          SpanName::SESSIONS_CREATE => {
            request: {
              ANTHROPIC_SESSION_ENVIRONMENT_ID => [[:environment_id], :string]
            },
            response: {
              GEN_AI_AGENT_NAME => [[:agent, :name], :string],
              GEN_AI_REQUEST_MODEL => [[:agent, :model, :id], :string]
            }
          }
        }.freeze

      # By span name; `nil` holds the recorders of every API call.
      @recorders = {}.freeze

      class << self
        # The settings of a client's spans, frozen: its `open_telemetry` option with
        # Symbol keys, where `:traces` is a Hash that has every one of {TRACES_KEYS}.
        # `true` and `false` are `{traces: <it>}`, and a `:traces` of `true` or `false` is
        # `{enabled: <it>}`. `nil`, for a client that is given no option, is what the
        # environment says, and the environment is read here and nowhere else. Any other
        # option is complete: what it leaves unset has the default, and no variable is
        # read.
        #
        # @param option [Hash{Symbol=>Object}, Boolean, nil]
        #
        # @raise [ArgumentError]
        # @return [Hash{Symbol=>Object}]
        def client_option(option)
          option = environment_option if option.nil?
          option = {traces: option} if [true, false].include?(option)
          option = option_hash(option, CLIENT_OPTION_KEYS, "`open_telemetry`", "true, false or a Hash")
          propagation = option[:propagation]
          unless [true, false, nil].include?(propagation)
            raise ArgumentError.new("`open_telemetry` [:propagation] must be true or false, got #{plain(propagation)}")
          end
          traces = option[:traces].nil? ? {} : option[:traces]
          traces = {enabled: traces} if [true, false].include?(traces)
          traces = option_hash(traces, TRACES_KEYS, "`open_telemetry` [:traces]", "true, false or a Hash")
          enabled, mode, bytes = traces.values_at(*TRACES_KEYS)
          unless [true, false, nil].include?(enabled)
            raise ArgumentError.new("`open_telemetry` [:traces][:enabled] must be true or false, got #{plain(enabled)}")
          end
          unless [nil, *CONTENT_MODES, *CONTENT_MODES.map(&:to_s)].include?(mode)
            modes = CONTENT_MODES.map(&:inspect).join(" or ")
            raise ArgumentError.new("`open_telemetry` [:traces][:content_mode] must be #{modes}, got #{plain(mode)}")
          end
          unless bytes.nil? || (bytes.is_a?(Integer) && bytes >= 1)
            raise ArgumentError.new(
              "`open_telemetry` [:traces][:max_content_bytes] must be an Integer of 1 or more, got #{plain(bytes)}"
            )
          end
          {
            tracer_provider: option[:tracer_provider],
            propagation: propagation.nil? || propagation,
            traces: {
              enabled: enabled.nil? || enabled,
              content_mode: mode&.to_sym || :metadata_only,
              max_content_bytes: bytes || DEFAULT_MAX_CONTENT_BYTES
            }.freeze
          }.freeze
        end

        # The `open_telemetry` request option with Symbol keys.
        #
        # @param option [Hash{Symbol=>Object}, nil]
        #
        # @raise [ArgumentError]
        # @return [Hash{Symbol=>Object}]
        def request_option(option)
          option_hash(option.nil? ? {} : option, REQUEST_OPTION_KEYS, "Request `open_telemetry`", "a Hash")
        end

        # The tracer for a client, or `nil` when its spans are disabled.
        #
        # @param option [Hash{Symbol=>Object}] from {client_option}
        #
        # @param scope [String]
        #
        # @return [OpenTelemetry::Trace::Tracer, nil]
        def tracer(option, scope = INSTRUMENTATION_SCOPE)
          return nil unless option[:traces][:enabled]

          provider = option[:tracer_provider] || OpenTelemetry.tracer_provider
          provider.tracer(scope, Anthropic::VERSION)
        end

        # Whether a client's spans have the `content` attributes.
        #
        # @param option [Hash{Symbol=>Object}] from {client_option}
        #
        # @return [Boolean]
        def content?(option) = option[:traces][:content_mode] == :content

        # The most bytes the `content` attributes of one of a client's spans hold.
        #
        # @param option [Hash{Symbol=>Object}] from {client_option}
        #
        # @return [Integer]
        def max_content_bytes(option) = option[:traces][:max_content_bytes]

        # Whether a client's requests carry the trace context of their span.
        #
        # @param option [Hash{Symbol=>Object}] from {client_option}
        #
        # @return [Boolean]
        def propagation?(option) = option[:propagation]

        # Returns `nil` when `req` has no `span_name`, or when the span neither records
        # nor propagates a trace context: with `propagation` off, a span whose context is
        # valid is kept, for the application's HTTP instrumentation to propagate. A span
        # that cannot start is `nil` too, and the call goes on without one.
        #
        # @param tracer [OpenTelemetry::Trace::Tracer]
        #
        # @param req [Hash{Symbol=>Object}] the request, as the SDK method gave it to `BaseClient#request`
        #
        # @param propagation [Boolean] whether the client's requests carry the trace context
        #
        # @return [OpenTelemetry::Trace::Span, nil]
        def start_api_call_span(tracer, req, propagation:)
          name = req[:span_name]
          return nil if name.nil?

          recording(name) do
            span = tracer.start_span(name, attributes: req[:span_attributes], kind: :client)
            span if span.recording? || (propagation ? !inject(span).empty? : span.context.valid?)
          end
        end

        # `span_name` is `nil` for every API call. The span starts with what
        # `recorder.start_attributes(client, req)` returns, without its `nil` values, and
        # `recorder.record(span, result)` runs right before the span ends, or before a
        # streamed body takes the span with it. An error that either raises is logged, and
        # does not fail the API call.
        #
        # @param span_name [String, nil] one of {SpanName}
        #
        # @param recorder [#start_attributes, #record]
        #
        # @return [void]
        def register_recorder(span_name, recorder)
          @recorders = {**@recorders, span_name => [*@recorders[span_name], recorder].freeze}.freeze
        end

        # A sampler reads only the attributes a span starts with, so everything known
        # before the first attempt is here.
        #
        # @param client [Anthropic::Internal::Transport::BaseClient]
        #
        # @param req [Hash{Symbol=>Object}] the request, as the SDK method gave it to `BaseClient#request`
        #
        # @return [Hash{String=>Object}]
        def api_call_span_attributes(client, req)
          url = client.base_url
          name = req[:span_name]
          attributes = {
            SERVER_ADDRESS => url.hostname,
            SERVER_PORT => url.port || {"https" => 443, "http" => 80}[url.scheme],
            HTTP_REQUEST_METHOD => req[:method].to_s.upcase,
            HTTP_ROUTE => req[:span_route],
            **client.open_telemetry_attributes,
            **recording(name) { request_attributes(client, req) }.to_h,
            **req[:span_attributes].to_h
          }
          recorders(name).each do |recorder|
            attributes.update(recording(name) { recorder.start_attributes(client, req) }.to_h)
          end
          attributes.compact
        end

        # The first send sets the URL attributes ({url_attributes}). Every later one, a
        # retry or a followed redirect, counts toward `http.request.resend_count`.
        #
        # @param span [OpenTelemetry::Trace::Span]
        #
        # @param client [Anthropic::Internal::Transport::BaseClient]
        #
        # @param request [Hash{Symbol=>Object}] the request, as `BaseClient#send_request` has it
        #
        # @param url [URI::Generic]
        #
        # @return [void]
        def record_send(span, client, request, url)
          sends = request[:sends] = request[:sends].to_i + 1
          recording(nil) do
            next unless span.recording?

            if sends == 1
              span.add_attributes(
                url_attributes(client, url, request[:span_query].to_a, request[:span_content_query].to_a)
              )
            else
              span.set_attribute(HTTP_REQUEST_RESEND_COUNT, sends - 1)
            end
          end
        end

        # A field that `response` lacks, or whose type is not the attribute's, sets
        # nothing.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param span_name [String, nil]
        # @param response [Anthropic::Internal::Type::BaseModel, Hash{Symbol=>Object}]
        #
        # @return [void]
        def set_response_attributes(span, span_name, response)
          SPAN_ATTRIBUTES.dig(span_name, :response).to_h.each do |attribute, (path, type)|
            value = attribute_value(dig(response, path), type)
            span.set_attribute(attribute, value) unless value.nil?
          end
        end

        # The trace context of `span` as request headers, with lowercase names: none when
        # the propagator fails.
        #
        # @param span [OpenTelemetry::Trace::Span]
        #
        # @return [Hash{String=>String}]
        def inject(span)
          carrier = {}
          recording(nil) do
            OpenTelemetry.propagation.inject(carrier, context: OpenTelemetry::Trace.context_with_span(span))
            carrier.transform_keys { _1.to_s.downcase }
          end || {}
        end

        # The lowercase names of the headers that carry a trace context. A propagator may
        # write headers that it does not list, so those {inject} writes for `span` count
        # too. A propagator that fails to list its headers counts as listing the standard
        # ones.
        #
        # @param span [OpenTelemetry::Trace::Span, nil]
        #
        # @return [Array<String>]
        def trace_header_names(span)
          standard = %w[traceparent tracestate baggage]
          names = recording(nil) do
            propagation = OpenTelemetry.propagation
            fields = propagation.respond_to?(:fields) ? propagation.fields : standard
            fields.map { _1.to_s.downcase }
          end || standard
          span ? names | inject(span).keys : names
        end

        # The status is `ERROR` for `result[:error]`, `OK` for `result[:data]`, and unset
        # when the call has neither because the application stopped it, such as with
        # `Interrupt`.
        #
        # @param span [OpenTelemetry::Trace::Span]
        #
        # @param result [Hash{Symbol=>Object}] the result of the API call, as far as the call got
        #
        #   @option result [Hash{Symbol=>Object}] :req the request, as the SDK method gave it to `BaseClient#request`
        #
        #   @option result [Anthropic::Internal::Transport::BaseClient] :client the client that makes the call
        #
        #   @option result [Float] :start_time when the call started, on the monotonic clock
        #
        #   @option result [Integer, nil] :status the status of the final response, when an attempt received one
        #
        #   @option result [Hash{String=>String}, nil] :headers the headers of the final response
        #
        #   @option result [Object] :data the decoded body, or a stream that reads it, when the call returned
        #
        #   @option result [StandardError, nil] :error what the call failed with
        #
        #   @option result [Enumerable<Object>, nil] :iterator the enumerator of a stream in `:data`: a recorder that follows the stream
        #   replaces it with one that reads through it
        #
        #   @option result [Object] :streamed_message what such a recorder keeps of the stream, for the SDK's stream helpers
        #
        # @return [void]
        def end_api_call_span(span, result)
          recording(result[:req][:span_name]) do
            next unless span.recording?

            set_response_status_code(span, result)
            set_response_header_attributes(span, result)
            set_created_id(span, result)
            record_result(span, result)
            if result[:error]
              set_error_status(span, result[:error])
            elsif result.key?(:data)
              span.status = OpenTelemetry::Trace::Status.ok
            end
            span.finish
          end
        end

        # Returns the stream that the application gets in place of `stream`: it ends
        # `span` when the read ends ({iterate_and_end_span}). `result` is as for
        # {end_api_call_span}.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param stream [Anthropic::Internal::Type::BaseStream]
        # @param result [Hash{Symbol=>Object}]
        #
        # @return [Anthropic::Internal::Type::BaseStream]
        def end_api_call_span_when_stream_ends(span, stream, result)
          recording(result[:req][:span_name]) do
            next stream unless span.recording?

            set_response_status_code(span, result)
            set_response_header_attributes(span, result)
            # A recorder that follows the stream wraps `result[:iterator]` first, so its read ends before the span does.
            result[:iterator] = stream.to_enum
            record_result(span, result)
            sse = stream.is_a?(Anthropic::Internal::Stream)
            iterator = iterate_and_end_span(result[:iterator], span, sse)
            Anthropic::Internal::TracedStream.new(stream, iterator, result[:streamed_message])
          end || stream
        end

        # Anything but a `StandardError`, such as `Interrupt`, is the application stopping
        # the operation, which leaves the status unset.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param error [Exception]
        #
        # @return [void]
        def set_error_status(span, error)
          return unless error.is_a?(StandardError)

          span.status = OpenTelemetry::Trace::Status.error
          span.set_attribute(ERROR_TYPE, error_type(error))
        end

        # @api private
        #
        # `option` with Symbol keys. Raises unless it is a Hash whose keys are all in
        # `keys`.
        #
        # @param option [Object]
        # @param keys [Array<Symbol>]
        # @param name [String]
        # @param expected [String]
        #
        # @raise [ArgumentError]
        # @return [Hash{Symbol=>Object}]
        private def option_hash(option, keys, name, expected)
          raise ArgumentError.new("#{name} must be #{expected}, got #{plain(option)}") unless option.is_a?(Hash)

          # `to_h` first: a subclass, such as one with indifferent access, can turn the keys back.
          option = option.to_h.transform_keys { _1.is_a?(String) ? _1.to_sym : _1 }
          unknown = option.keys.find { !keys.include?(_1) }
          return option if unknown.nil?

          raise ArgumentError.new("#{name} keys must be one of #{keys}, got #{plain(unknown)}")
        end

        # @api private
        #
        # The option can hold a tracer provider or content, so an error message shows a
        # value only when it is a plain one, and its class otherwise.
        #
        # @param value [Object]
        #
        # @return [String]
        private def plain(value)
          case value
          when String, Symbol, Numeric, true, false, nil then value.inspect
          else "a #{value.class}"
          end
        end

        # @api private
        #
        # The `open_telemetry` option that the environment variables stand for. Only
        # `false`, in any case, turns the spans or the propagation off.
        #
        # @return [Hash{Symbol=>Object}]
        private def environment_option
          {
            propagation: !ENV["ANTHROPIC_OPEN_TELEMETRY_PROPAGATION"]&.casecmp?("false"),
            traces: {
              enabled: !ENV["ANTHROPIC_OPEN_TELEMETRY"]&.casecmp?("false"),
              content_mode: environment_content_mode,
              max_content_bytes: environment_max_content_bytes
            }
          }
        end

        # @api private
        #
        # Anything but `content`, in any case, is `:metadata_only`.
        #
        # @return [Symbol]
        private def environment_content_mode
          content = ENV["ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE"].to_s.casecmp?("content")
          content ? :content : :metadata_only
        end

        # @api private
        #
        # `nil` unless the variable is a whole number of 1 or more, in decimal digits.
        #
        # @return [Integer, nil]
        private def environment_max_content_bytes
          value = ENV["ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES"].to_s.strip
          bytes = value.to_i if value.match?(/\A\d+\z/)
          bytes if bytes&.positive?
        end

        # @api private
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param result [Hash{Symbol=>Object}]
        #
        # @return [void]
        private def set_response_status_code(span, result)
          error = result[:error]
          status = result[:status] || (error.status if error.is_a?(Anthropic::Errors::APIError))
          span.set_attribute(HTTP_RESPONSE_STATUS_CODE, status) if status
        end

        # @api private
        #
        # `span_created_id` names the attribute for the created object's `id`, or, as
        # `{"<attribute>" => :user_id}`, for another of its fields.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param result [Hash{Symbol=>Object}]
        #
        # @return [void]
        private def set_created_id(span, result)
          attribute = result[:req][:span_created_id]
          created = result[:data]
          return if attribute.nil? || !created.is_a?(Anthropic::Internal::Type::BaseModel)

          attribute, field = attribute.is_a?(Hash) ? attribute.first : [attribute, :id]
          id = created[field]
          span.set_attribute(attribute, id) if id.is_a?(String)
        end

        # @api private
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param result [Hash{Symbol=>Object}]
        #
        # @return [void]
        private def set_response_header_attributes(span, result)
          error = result[:error]
          headers = result[:headers] || (error.headers if error.is_a?(Anthropic::Errors::APIError)) || {}
          RESPONSE_HEADER_ATTRIBUTES.each do |attribute, header|
            value = headers[header]
            span.set_attribute(attribute, value) unless value.nil? || value.empty?
          end
        end

        # @api private
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param result [Hash{Symbol=>Object}]
        #
        # @return [void]
        private def record_result(span, result)
          name = result[:req][:span_name]
          data = result[:data]
          recording(name) { set_response_attributes(span, name, data) } if data.is_a?(Anthropic::Internal::Type::BaseModel)
          recorders(name).each { |recorder| recording(name) { recorder.record(span, result) } }
        end

        # @api private
        #
        # @param span_name [String, nil]
        #
        # @return [Array<#start_attributes, #record>]
        private def recorders(span_name)
          span_name.nil? ? [*@recorders[nil]] : [*@recorders[nil], *@recorders[span_name]]
        end

        # @api private
        #
        # A failure to trace must not fail the API call, so an error raised in the block,
        # such as one from a span processor of the application, is logged, and the value
        # is then `nil`.
        #
        # @param span_name [String, nil]
        #
        # @return [Object]
        private def recording(span_name)
          yield
        rescue StandardError => e
          OpenTelemetry.logger.debug("#{INSTRUMENTATION_SCOPE}: could not record on the span #{span_name}: #{e.class}")
          nil
        end

        # @api private
        #
        # `url.query` and `url.full` keep only the pairs whose name the endpoint defines
        # (`query_names`, or one of them followed by `[]`), so none that the application
        # added. Both are left out when a kept pair is content
        # ({CONTENT_QUERY_PARAMETERS}, `content_names`) and the client's spans have none.
        #
        # @param client [Anthropic::Internal::Transport::BaseClient]
        # @param url [URI::Generic]
        # @param query_names [Array<String>]
        # @param content_names [Array<String>]
        #
        # @return [Hash{String=>String}]
        private def url_attributes(client, url, query_names, content_names)
          pairs = url.query.to_s.split("&").filter_map do |pair|
            name = URI.decode_www_form_component(pair.partition("=").first)
            defined = [name, name.delete_suffix("[]")].find { query_names.include?(_1) }
            [defined, pair] unless defined.nil?
          end
          attributes = {URL_SCHEME => url.scheme, URL_PATH => url.path}
          content = pairs.any? do |defined, _|
            CONTENT_QUERY_PARAMETERS.include?(defined) || content_names.include?(defined)
          end
          return attributes if content && !client.open_telemetry_content?

          query = pairs.map(&:last).join("&") unless pairs.empty?
          server = client.base_url
          authority = url.port == url.default_port ? server.host : "#{server.host}:#{server.port}"
          attributes[URL_QUERY] = query unless query.nil?
          attributes[URL_FULL] = "#{url.scheme}://#{authority}#{url.path}#{"?#{query}" if query}"
          attributes
        end

        # @api private
        #
        # @param client [Anthropic::Internal::Transport::BaseClient]
        # @param req [Hash{Symbol=>Object}]
        #
        # @return [Hash{String=>Object}]
        private def request_attributes(client, req)
          table = SPAN_ATTRIBUTES[req[:span_name]]
          return {} if table.nil?

          attributes = {**table[:constants].to_h}
          table[:request].to_h.each do |attribute, (path, type)|
            attributes[attribute] = attribute_value(dig(req[:body], path), type)
          end
          unless table[:request_headers].nil?
            headers = Anthropic::Internal::Util.normalized_headers(
              client.headers,
              req[:headers].to_h,
              req[:options].to_h[:extra_headers].to_h
            )
            table[:request_headers].each do |attribute, (header, type)|
              attributes[attribute] = header_value(headers[header], type)
            end
          end
          attributes[table[:stream]] = true if table.key?(:stream) && req[:stream]
          attributes
        end

        # @api private
        #
        # @param data [Object]
        # @param path [Array<Symbol>]
        #
        # @return [Object]
        private def dig(data, path)
          path.reduce(data) do |value, field|
            case value
            in Hash | Anthropic::Internal::Type::BaseModel
              value[field]
            else
              return nil
            end
          end
        end

        # @api private
        #
        # `nil` for a value of another type than `type`, so that a response this SDK
        # version does not know sets no attribute rather than a wrong one.
        #
        # @param value [Object]
        # @param type [Symbol, Array<Symbol>]
        #
        # @return [Object]
        private def attribute_value(value, type)
          case [type, value]
          in [:string | :any, String | Symbol]
            value.to_s
          in [:integer | :any, Integer] | [:boolean | :any, true | false] | [:any, Float]
            value
          in [:number, Numeric]
            value.to_f
          in [[inner], Array]
            values = value.map { attribute_value(_1, inner) }
            values unless values.any?(&:nil?)
          else
            nil
          end
        end

        # @api private
        #
        # @param value [String, nil]
        # @param type [Symbol, Array<Symbol>]
        #
        # @return [Object]
        private def header_value(value, type)
          values = value.to_s.split(",").map(&:strip).reject(&:empty?)
          return nil if values.empty?

          type.is_a?(Array) ? values : value.to_s
        end

        # @api private
        #
        # The first iteration ends `span` exactly once, however the read ends: `OK` when
        # exhausted, `ERROR` when it fails, unset when the application closes it early.
        # Server-sent events have no end that this code knows, so the server ending them
        # (`events`) sets no status: whoever knows their end event does. A later iteration
        # reads `source` as is, without touching the span.
        #
        # @param source [Enumerator<Object>]
        # @param span [OpenTelemetry::Trace::Span]
        # @param events [Boolean]
        #
        # @return [Enumerator<Object>]
        private def iterate_and_end_span(source, span, events)
          claimed = false
          ended = false
          finish = lambda do |exhausted: false, error: nil|
            next if ended

            ended = true
            recording(nil) do
              if error
                set_error_status(span, error)
              elsif exhausted && !events
                span.status = OpenTelemetry::Trace::Status.ok
              end
              span.finish
            end
          end

          traced = Enumerator.new do |y|
            next source.each(&y) if claimed

            claimed = true
            # An error raised in the application's block is not a read failure.
            yielding = false
            begin
              source.each do |item|
                yielding = true
                y << item
                yielding = false
              end
              finish.call(exhausted: true)
            rescue StandardError => e
              finish.call(error: (e unless yielding))
              raise
            ensure
              finish.call
            end
          end
          # The SDK closes a stream by rewinding its enumerator. That does not resume a read
          # suspended in `Enumerator#next`, whose `ensure` would never run, so the span ends here.
          traced.define_singleton_method(:rewind) do
            source.rewind
            finish.call
            self
          end
          traced
        end

        # @api private
        #
        # @param error [StandardError]
        #
        # @return [String]
        private def error_type(error)
          case error
          in Anthropic::Errors::APITimeoutError
            "client_timeout_error"
          in Anthropic::Errors::APIConnectionError
            "connection_error"
          in Anthropic::Errors::APIError if error.status
            type = Anthropic::Internal::Util.dig(error.body, [:error, :type])
            type.is_a?(String) ? type : error.status.to_s
          else
            "client_error"
          end
        end
      end
    end
  end
end
