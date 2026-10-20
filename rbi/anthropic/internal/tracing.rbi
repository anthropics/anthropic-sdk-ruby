# typed: strong

module Anthropic
  module Internal
    # @api private
    #
    # What a streaming method returns when its API call has a recording span. Reading
    # or closing it reads or closes the SDK's own stream, and ends the span.
    class TracedStream
      Message = type_member(:in) { { fixed: T.anything } }
      Elem = type_member(:out)

      include Anthropic::Internal::Type::BaseStream

      # What a recorder that follows this stream has read of it.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :streamed_message

      # @api private
      sig do
        params(
          stream: Anthropic::Internal::Type::BaseStream[T.noreturn, Elem],
          iterator: T::Enumerable[Elem],
          streamed_message: T.nilable(T.anything)
        ).void
      end
      def initialize(
        # the SDK's own stream
        stream,
        # reads `stream`, and ends the span
        iterator,
        streamed_message
      )
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
      GEN_AI_USAGE_CACHE_WRITE_INPUT_TOKENS =
        "gen_ai.usage.cache_write.input_tokens"
      GEN_AI_USAGE_CACHE_READ_INPUT_TOKENS =
        "gen_ai.usage.cache_read.input_tokens"
      ANTHROPIC_USAGE_CACHE_CREATION_EPHEMERAL_5M_INPUT_TOKENS =
        "anthropic.usage.cache_creation.ephemeral_5m_input_tokens"
      ANTHROPIC_USAGE_CACHE_CREATION_EPHEMERAL_1H_INPUT_TOKENS =
        "anthropic.usage.cache_creation.ephemeral_1h_input_tokens"
      ANTHROPIC_RESPONSE_SERVICE_TIER = "anthropic.response.service_tier"
      GEN_AI_USAGE_OUTPUT_TOKENS = "gen_ai.usage.output_tokens"
      GEN_AI_USAGE_REASONING_OUTPUT_TOKENS =
        "gen_ai.usage.reasoning.output_tokens"
      ANTHROPIC_MESSAGE_STOP_REASON = "anthropic.message.stop_reason"
      ANTHROPIC_MESSAGE_COUNT_TOKENS_INPUT_TOKENS =
        "anthropic.message.count_tokens.input_tokens"
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
        USER_PROFILES_CREATE = "anthropic.user_profiles.create"
        USER_PROFILES_RETRIEVE = "anthropic.user_profiles.retrieve"
        USER_PROFILES_UPDATE = "anthropic.user_profiles.update"
        USER_PROFILES_LIST = "anthropic.user_profiles.list"
        USER_PROFILES_DELETE = "anthropic.user_profiles.delete"
        USER_PROFILES_ACTION_URLS_CREATE =
          "anthropic.user_profiles.action_urls.create"
        ORGANIZATION_RETRIEVE = "anthropic.organization.retrieve"
        ORGANIZATION_API_KEYS_RETRIEVE =
          "anthropic.organization.api_keys.retrieve"
        ORGANIZATION_API_KEYS_UPDATE = "anthropic.organization.api_keys.update"
        ORGANIZATION_API_KEYS_LIST = "anthropic.organization.api_keys.list"
        ORGANIZATION_EXTERNAL_KEYS_CREATE =
          "anthropic.organization.external_keys.create"
        ORGANIZATION_EXTERNAL_KEYS_RETRIEVE =
          "anthropic.organization.external_keys.retrieve"
        ORGANIZATION_EXTERNAL_KEYS_UPDATE =
          "anthropic.organization.external_keys.update"
        ORGANIZATION_EXTERNAL_KEYS_LIST =
          "anthropic.organization.external_keys.list"
        ORGANIZATION_EXTERNAL_KEYS_DELETE =
          "anthropic.organization.external_keys.delete"
        ORGANIZATION_EXTERNAL_KEYS_VALIDATE =
          "anthropic.organization.external_keys.validate"
        ORGANIZATION_FEDERATION_ISSUERS_CREATE =
          "anthropic.organization.federation.issuers.create"
        ORGANIZATION_FEDERATION_ISSUERS_RETRIEVE =
          "anthropic.organization.federation.issuers.retrieve"
        ORGANIZATION_FEDERATION_ISSUERS_UPDATE =
          "anthropic.organization.federation.issuers.update"
        ORGANIZATION_FEDERATION_ISSUERS_LIST =
          "anthropic.organization.federation.issuers.list"
        ORGANIZATION_FEDERATION_ISSUERS_ARCHIVE =
          "anthropic.organization.federation.issuers.archive"
        ORGANIZATION_FEDERATION_RULES_CREATE =
          "anthropic.organization.federation.rules.create"
        ORGANIZATION_FEDERATION_RULES_RETRIEVE =
          "anthropic.organization.federation.rules.retrieve"
        ORGANIZATION_FEDERATION_RULES_UPDATE =
          "anthropic.organization.federation.rules.update"
        ORGANIZATION_FEDERATION_RULES_LIST =
          "anthropic.organization.federation.rules.list"
        ORGANIZATION_FEDERATION_RULES_ARCHIVE =
          "anthropic.organization.federation.rules.archive"
        ORGANIZATION_FEDERATION_RULES_WORKSPACES_LIST =
          "anthropic.organization.federation.rules.workspaces.list"
        ORGANIZATION_FEDERATION_RULES_WORKSPACES_ADD =
          "anthropic.organization.federation.rules.workspaces.add"
        ORGANIZATION_FEDERATION_RULES_WORKSPACES_REMOVE =
          "anthropic.organization.federation.rules.workspaces.remove"
        ORGANIZATION_INVITES_CREATE = "anthropic.organization.invites.create"
        ORGANIZATION_INVITES_RETRIEVE =
          "anthropic.organization.invites.retrieve"
        ORGANIZATION_INVITES_LIST = "anthropic.organization.invites.list"
        ORGANIZATION_INVITES_DELETE = "anthropic.organization.invites.delete"
        ORGANIZATION_SERVICE_ACCOUNTS_CREATE =
          "anthropic.organization.service_accounts.create"
        ORGANIZATION_SERVICE_ACCOUNTS_RETRIEVE =
          "anthropic.organization.service_accounts.retrieve"
        ORGANIZATION_SERVICE_ACCOUNTS_UPDATE =
          "anthropic.organization.service_accounts.update"
        ORGANIZATION_SERVICE_ACCOUNTS_LIST =
          "anthropic.organization.service_accounts.list"
        ORGANIZATION_SERVICE_ACCOUNTS_ARCHIVE =
          "anthropic.organization.service_accounts.archive"
        ORGANIZATION_SERVICE_ACCOUNTS_WORKSPACES_LIST =
          "anthropic.organization.service_accounts.workspaces.list"
        ORGANIZATION_SERVICE_ACCOUNTS_WORKSPACES_ADD =
          "anthropic.organization.service_accounts.workspaces.add"
        ORGANIZATION_SERVICE_ACCOUNTS_WORKSPACES_REMOVE =
          "anthropic.organization.service_accounts.workspaces.remove"
        ORGANIZATION_USERS_RETRIEVE = "anthropic.organization.users.retrieve"
        ORGANIZATION_USERS_UPDATE = "anthropic.organization.users.update"
        ORGANIZATION_USERS_LIST = "anthropic.organization.users.list"
        ORGANIZATION_USERS_REMOVE = "anthropic.organization.users.remove"
        ORGANIZATION_WORKSPACES_CREATE =
          "anthropic.organization.workspaces.create"
        ORGANIZATION_WORKSPACES_RETRIEVE =
          "anthropic.organization.workspaces.retrieve"
        ORGANIZATION_WORKSPACES_UPDATE =
          "anthropic.organization.workspaces.update"
        ORGANIZATION_WORKSPACES_LIST = "anthropic.organization.workspaces.list"
        ORGANIZATION_WORKSPACES_ARCHIVE =
          "anthropic.organization.workspaces.archive"
        ORGANIZATION_WORKSPACES_RATE_LIMITS_UPDATE =
          "anthropic.organization.workspaces.rate_limits.update"
        ORGANIZATION_WORKSPACES_RATE_LIMITS_LIST =
          "anthropic.organization.workspaces.rate_limits.list"
        ORGANIZATION_WORKSPACES_MEMBERS_RETRIEVE =
          "anthropic.organization.workspaces.members.retrieve"
        ORGANIZATION_WORKSPACES_MEMBERS_UPDATE =
          "anthropic.organization.workspaces.members.update"
        ORGANIZATION_WORKSPACES_MEMBERS_LIST =
          "anthropic.organization.workspaces.members.list"
        ORGANIZATION_WORKSPACES_MEMBERS_ADD =
          "anthropic.organization.workspaces.members.add"
        ORGANIZATION_WORKSPACES_MEMBERS_REMOVE =
          "anthropic.organization.workspaces.members.remove"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_RETRIEVE =
          "anthropic.organization.workspaces.service_accounts.retrieve"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_UPDATE =
          "anthropic.organization.workspaces.service_accounts.update"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_LIST =
          "anthropic.organization.workspaces.service_accounts.list"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_ADD =
          "anthropic.organization.workspaces.service_accounts.add"
        ORGANIZATION_WORKSPACES_SERVICE_ACCOUNTS_REMOVE =
          "anthropic.organization.workspaces.service_accounts.remove"
        ORGANIZATION_RATE_LIMITS_LIST =
          "anthropic.organization.rate_limits.list"
        ORGANIZATION_COMPLIANCE_SETTINGS_RETRIEVE =
          "anthropic.organization.compliance_settings.retrieve"
        ORGANIZATION_COMPLIANCE_SETTINGS_UPDATE =
          "anthropic.organization.compliance_settings.update"
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
        SESSIONS_THREADS_EVENTS_STREAM =
          "anthropic.sessions.threads.events.stream"
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
        VAULTS_CREDENTIALS_MCP_OAUTH_VALIDATE =
          "anthropic.vaults.credentials.mcp_oauth_validate"
        MEMORY_STORES_CREATE = "anthropic.memory_stores.create"
        MEMORY_STORES_RETRIEVE = "anthropic.memory_stores.retrieve"
        MEMORY_STORES_UPDATE = "anthropic.memory_stores.update"
        MEMORY_STORES_LIST = "anthropic.memory_stores.list"
        MEMORY_STORES_DELETE = "anthropic.memory_stores.delete"
        MEMORY_STORES_ARCHIVE = "anthropic.memory_stores.archive"
        MEMORY_STORES_MEMORIES_CREATE =
          "anthropic.memory_stores.memories.create"
        MEMORY_STORES_MEMORIES_RETRIEVE =
          "anthropic.memory_stores.memories.retrieve"
        MEMORY_STORES_MEMORIES_UPDATE =
          "anthropic.memory_stores.memories.update"
        MEMORY_STORES_MEMORIES_LIST = "anthropic.memory_stores.memories.list"
        MEMORY_STORES_MEMORIES_DELETE =
          "anthropic.memory_stores.memories.delete"
        MEMORY_STORES_MEMORY_VERSIONS_RETRIEVE =
          "anthropic.memory_stores.memory_versions.retrieve"
        MEMORY_STORES_MEMORY_VERSIONS_LIST =
          "anthropic.memory_stores.memory_versions.list"
        MEMORY_STORES_MEMORY_VERSIONS_REDACT =
          "anthropic.memory_stores.memory_versions.redact"
        SKILLS_VERSIONS_DOWNLOAD = "anthropic.skills.versions.download"
        USER_PROFILES_CREATE_ENROLLMENT_URL =
          "anthropic.user_profiles.create_enrollment_url"
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
        TUNNELS_CERTIFICATES_RETRIEVE =
          "anthropic.tunnels.certificates.retrieve"
        TUNNELS_CERTIFICATES_LIST = "anthropic.tunnels.certificates.list"
        TUNNELS_CERTIFICATES_ARCHIVE = "anthropic.tunnels.certificates.archive"
        ORGANIZATION_ANALYTICS_SUMMARIES_LIST =
          "anthropic.organization.analytics.summaries.list"
        ORGANIZATION_ANALYTICS_USERS_LIST =
          "anthropic.organization.analytics.users.list"
        ORGANIZATION_ANALYTICS_APPS_CHAT_PROJECTS_LIST =
          "anthropic.organization.analytics.apps.chat.projects.list"
        ORGANIZATION_ANALYTICS_CONNECTORS_LIST =
          "anthropic.organization.analytics.connectors.list"
        ORGANIZATION_ANALYTICS_PLUGINS_LIST =
          "anthropic.organization.analytics.plugins.list"
        ORGANIZATION_ANALYTICS_SKILLS_LIST =
          "anthropic.organization.analytics.skills.list"
        ORGANIZATION_ANALYTICS_ARTIFACTS_LIST =
          "anthropic.organization.analytics.artifacts.list"
        ORGANIZATION_ANALYTICS_USAGE_REPORT_LIST =
          "anthropic.organization.analytics.usage_report.list"
        ORGANIZATION_ANALYTICS_USER_USAGE_REPORT_LIST =
          "anthropic.organization.analytics.user_usage_report.list"
        ORGANIZATION_ANALYTICS_COST_REPORT_LIST =
          "anthropic.organization.analytics.cost_report.list"
        ORGANIZATION_ANALYTICS_USER_COST_REPORT_LIST =
          "anthropic.organization.analytics.user_cost_report.list"
        ORGANIZATION_SPEND_LIMITS_RETRIEVE =
          "anthropic.organization.spend_limits.retrieve"
        ORGANIZATION_SPEND_LIMITS_LIST =
          "anthropic.organization.spend_limits.list"
        ORGANIZATION_SPEND_LIMITS_DELETE =
          "anthropic.organization.spend_limits.delete"
        ORGANIZATION_SPEND_LIMITS_SET =
          "anthropic.organization.spend_limits.set"
        ORGANIZATION_SPEND_LIMITS_EFFECTIVE_LIST =
          "anthropic.organization.spend_limits.effective.list"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_RETRIEVE =
          "anthropic.organization.spend_limits.increase_requests.retrieve"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_LIST =
          "anthropic.organization.spend_limits.increase_requests.list"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_APPROVE =
          "anthropic.organization.spend_limits.increase_requests.approve"
        ORGANIZATION_SPEND_LIMITS_INCREASE_REQUESTS_DENY =
          "anthropic.organization.spend_limits.increase_requests.deny"
        ORGANIZATION_RBAC_GROUPS_CREATE =
          "anthropic.organization.rbac_groups.create"
        ORGANIZATION_RBAC_GROUPS_RETRIEVE =
          "anthropic.organization.rbac_groups.retrieve"
        ORGANIZATION_RBAC_GROUPS_UPDATE =
          "anthropic.organization.rbac_groups.update"
        ORGANIZATION_RBAC_GROUPS_LIST =
          "anthropic.organization.rbac_groups.list"
        ORGANIZATION_RBAC_GROUPS_DELETE =
          "anthropic.organization.rbac_groups.delete"
        ORGANIZATION_RBAC_GROUPS_MEMBERS_LIST =
          "anthropic.organization.rbac_groups.members.list"
        ORGANIZATION_RBAC_GROUPS_MEMBERS_ADD =
          "anthropic.organization.rbac_groups.members.add"
        ORGANIZATION_RBAC_GROUPS_MEMBERS_REMOVE =
          "anthropic.organization.rbac_groups.members.remove"
        ORGANIZATION_RBAC_ROLES_RETRIEVE =
          "anthropic.organization.rbac_roles.retrieve"
        ORGANIZATION_RBAC_ROLES_LIST = "anthropic.organization.rbac_roles.list"
        ORGANIZATION_RBAC_ROLES_PERMISSIONS_LIST =
          "anthropic.organization.rbac_roles.permissions.list"
        ORGANIZATION_PLUGINS_CREATE = "anthropic.organization.plugins.create"
        ORGANIZATION_PLUGINS_RETRIEVE =
          "anthropic.organization.plugins.retrieve"
        ORGANIZATION_PLUGINS_UPDATE = "anthropic.organization.plugins.update"
        ORGANIZATION_PLUGINS_LIST = "anthropic.organization.plugins.list"
        ORGANIZATION_PLUGINS_DELETE = "anthropic.organization.plugins.delete"
        ORGANIZATION_PLUGINS_VERSIONS_CREATE =
          "anthropic.organization.plugins.versions.create"
        ORGANIZATION_PLUGINS_VERSIONS_RETRIEVE =
          "anthropic.organization.plugins.versions.retrieve"
        ORGANIZATION_PLUGINS_VERSIONS_LIST =
          "anthropic.organization.plugins.versions.list"
        ORGANIZATION_PLUGINS_VERSIONS_DOWNLOAD =
          "anthropic.organization.plugins.versions.download"
        ORGANIZATION_PLUGINS_INSTALLATION_SETTINGS_LIST =
          "anthropic.organization.plugins.installation_settings.list"
        ORGANIZATION_PLUGINS_INSTALLATION_SETTINGS_REMOVE =
          "anthropic.organization.plugins.installation_settings.remove"
        ORGANIZATION_PLUGINS_INSTALLATION_SETTINGS_SET =
          "anthropic.organization.plugins.installation_settings.set"
        ORGANIZATION_PLUGINS_SHARES_LIST =
          "anthropic.organization.plugins.shares.list"
        ORGANIZATION_PLUGIN_MARKETPLACES_RETRIEVE =
          "anthropic.organization.plugin_marketplaces.retrieve"
        ORGANIZATION_PLUGIN_MARKETPLACES_UPDATE =
          "anthropic.organization.plugin_marketplaces.update"
        ORGANIZATION_PLUGIN_MARKETPLACES_LIST =
          "anthropic.organization.plugin_marketplaces.list"
        ORGANIZATION_PLUGIN_MARKETPLACES_VALIDATE_ARCHIVE =
          "anthropic.organization.plugin_marketplaces.validate_archive"
        ORGANIZATION_PLUGIN_MARKETPLACES_VALIDATE_REPOSITORY =
          "anthropic.organization.plugin_marketplaces.validate_repository"
        ORGANIZATION_TELEMETRY_DESTINATIONS_CREATE =
          "anthropic.organization.telemetry_destinations.create"
        ORGANIZATION_TELEMETRY_DESTINATIONS_RETRIEVE =
          "anthropic.organization.telemetry_destinations.retrieve"
        ORGANIZATION_TELEMETRY_DESTINATIONS_UPDATE =
          "anthropic.organization.telemetry_destinations.update"
        ORGANIZATION_TELEMETRY_DESTINATIONS_LIST =
          "anthropic.organization.telemetry_destinations.list"
        ORGANIZATION_TELEMETRY_DESTINATIONS_DELETE =
          "anthropic.organization.telemetry_destinations.delete"
        ORGANIZATION_TELEMETRY_DESTINATIONS_TEST =
          "anthropic.organization.telemetry_destinations.test"
        ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_LIST =
          "anthropic.organization.telemetry_destinations.workspaces.list"
        ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_ADD =
          "anthropic.organization.telemetry_destinations.workspaces.add"
        ORGANIZATION_TELEMETRY_DESTINATIONS_WORKSPACES_REMOVE =
          "anthropic.organization.telemetry_destinations.workspaces.remove"
        ORGANIZATION_WEBHOOKS_CREATE = "anthropic.organization.webhooks.create"
        ORGANIZATION_WEBHOOKS_RETRIEVE =
          "anthropic.organization.webhooks.retrieve"
        ORGANIZATION_WEBHOOKS_UPDATE = "anthropic.organization.webhooks.update"
        ORGANIZATION_WEBHOOKS_LIST = "anthropic.organization.webhooks.list"
        ORGANIZATION_WEBHOOKS_DELETE = "anthropic.organization.webhooks.delete"
        ORGANIZATION_WEBHOOKS_REGENERATE_SIGNING_SECRET =
          "anthropic.organization.webhooks.regenerate_signing_secret"
      end

      CLIENT_ATTRIBUTES = T.let(T.unsafe(nil), T::Hash[String, String])

      # Each attribute with the response header it comes from.
      RESPONSE_HEADER_ATTRIBUTES = T.let(T.unsafe(nil), T::Hash[String, String])

      CLIENT_OPTION_KEYS = T.let(T.unsafe(nil), T::Array[Symbol])

      TRACES_KEYS = T.let(T.unsafe(nil), T::Array[Symbol])

      CONTENT_MODES = T.let(T.unsafe(nil), T::Array[Symbol])

      # The most bytes the `content` attributes of one span hold when
      # `max_content_bytes` sets no other bound.
      DEFAULT_MAX_CONTENT_BYTES = T.let(T.unsafe(nil), Integer)

      REQUEST_OPTION_KEYS = T.let(T.unsafe(nil), T::Array[Symbol])

      # Query parameters whose value is content on every endpoint that defines them.
      CONTENT_QUERY_PARAMETERS = T.let(T.unsafe(nil), T::Array[String])

      # By span name. `:request` and `:response` map an attribute to `[path, type]` in
      # that body, `:request_headers` to `[header, type]`.
      SPAN_ATTRIBUTES =
        T.let(T.unsafe(nil), T::Hash[String, T::Hash[Symbol, T.anything]])

      class << self
        # The settings of a client's spans, frozen: its `open_telemetry` option with
        # Symbol keys, where `:traces` is a Hash that has every one of {TRACES_KEYS}.
        # `true` and `false` are `{traces: <it>}`, and a `:traces` of `true` or `false` is
        # `{enabled: <it>}`. `nil`, for a client that is given no option, is what the
        # environment says, and the environment is read here and nowhere else. Any other
        # option is complete: what it leaves unset has the default, and no variable is
        # read.
        sig do
          params(
            option:
              T.nilable(
                T.any(T::Hash[T.any(Symbol, String), T.anything], T::Boolean)
              )
          ).returns(T::Hash[Symbol, T.anything])
        end
        def client_option(option)
        end

        # The `open_telemetry` request option with Symbol keys.
        sig do
          params(
            option: T.nilable(T::Hash[T.any(Symbol, String), T.anything])
          ).returns(T::Hash[Symbol, T.anything])
        end
        def request_option(option)
        end

        # The tracer for a client, or `nil` when its spans are disabled.
        sig do
          params(option: T::Hash[Symbol, T.anything], scope: String).returns(
            T.nilable(T.anything)
          )
        end
        def tracer(
          # from {client_option}
          option,
          scope = INSTRUMENTATION_SCOPE
        )
        end

        # Whether a client's spans have the `content` attributes.
        sig { params(option: T::Hash[Symbol, T.anything]).returns(T::Boolean) }
        def content?(
          # from {client_option}
          option
        )
        end

        # The most bytes the `content` attributes of one of a client's spans hold.
        sig { params(option: T::Hash[Symbol, T.anything]).returns(Integer) }
        def max_content_bytes(
          # from {client_option}
          option
        )
        end

        # Whether a client's requests carry the trace context of their span.
        sig { params(option: T::Hash[Symbol, T.anything]).returns(T::Boolean) }
        def propagation?(
          # from {client_option}
          option
        )
        end

        # Returns `nil` when `req` has no `span_name`, or when the span neither records
        # nor propagates a trace context: with `propagation` off, a span whose context is
        # valid is kept, for the application's HTTP instrumentation to propagate. A span
        # that cannot start is `nil` too, and the call goes on without one.
        sig do
          params(
            tracer: T.anything,
            req: T::Hash[Symbol, T.anything],
            propagation: T::Boolean
          ).returns(T.nilable(T.anything))
        end
        def start_api_call_span(
          tracer,
          # the request, as the SDK method gave it to `BaseClient#request`
          req,
          # whether the client's requests carry the trace context
          propagation:
        )
        end

        # `span_name` is `nil` for every API call. The span starts with what
        # `recorder.start_attributes(client, req)` returns, without its `nil` values, and
        # `recorder.record(span, result)` runs right before the span ends, or before a
        # streamed body takes the span with it. An error that either raises is logged, and
        # does not fail the API call.
        sig { params(span_name: T.nilable(String), recorder: T.anything).void }
        def register_recorder(
          # one of {SpanName}
          span_name,
          recorder
        )
        end

        # A sampler reads only the attributes a span starts with, so everything known
        # before the first attempt is here.
        sig do
          params(
            client: Anthropic::Internal::Transport::BaseClient,
            req: T::Hash[Symbol, T.anything]
          ).returns(T::Hash[String, T.anything])
        end
        def api_call_span_attributes(
          client,
          # the request, as the SDK method gave it to `BaseClient#request`
          req
        )
        end

        # The first send sets the URL attributes ({url_attributes}). Every later one, a
        # retry or a followed redirect, counts toward `http.request.resend_count`.
        sig do
          params(
            span: T.anything,
            client: Anthropic::Internal::Transport::BaseClient,
            request: T::Hash[Symbol, T.anything],
            url: URI::Generic
          ).void
        end
        def record_send(
          span,
          client,
          # the request, as `BaseClient#send_request` has it
          request,
          url
        )
        end

        # A field that `response` lacks, or whose type is not the attribute's, sets
        # nothing.
        sig do
          params(
            span: T.anything,
            span_name: T.nilable(String),
            response:
              T.any(
                Anthropic::Internal::Type::BaseModel,
                T::Hash[Symbol, T.anything]
              )
          ).void
        end
        def set_response_attributes(span, span_name, response)
        end

        # The trace context of `span` as request headers, with lowercase names: none when
        # the propagator fails.
        sig { params(span: T.anything).returns(T::Hash[String, String]) }
        def inject(span)
        end

        # The lowercase names of the headers that carry a trace context. A propagator may
        # write headers that it does not list, so those {inject} writes for `span` count
        # too. A propagator that fails to list its headers counts as listing the standard
        # ones.
        sig { params(span: T.nilable(T.anything)).returns(T::Array[String]) }
        def trace_header_names(span)
        end

        # The status is `ERROR` for `result[:error]`, `OK` for `result[:data]`, and unset
        # when the call has neither because the application stopped it, such as with
        # `Interrupt`.
        sig do
          params(span: T.anything, result: T::Hash[Symbol, T.anything]).void
        end
        def end_api_call_span(
          span,
          # the result of the API call, as far as the call got
          result
        )
        end

        # Returns the stream that the application gets in place of `stream`: it ends
        # `span` when the read ends ({iterate_and_end_span}). `result` is as for
        # {end_api_call_span}.
        sig do
          params(
            span: T.anything,
            stream:
              Anthropic::Internal::Type::BaseStream[T.noreturn, T.anything],
            result: T::Hash[Symbol, T.anything]
          ).returns(
            Anthropic::Internal::Type::BaseStream[T.noreturn, T.anything]
          )
        end
        def end_api_call_span_when_stream_ends(span, stream, result)
        end

        # Anything but a `StandardError`, such as `Interrupt`, is the application stopping
        # the operation, which leaves the status unset.
        sig { params(span: T.anything, error: Exception).void }
        def set_error_status(span, error)
        end

        # @api private
        #
        # `option` with Symbol keys. Raises unless it is a Hash whose keys are all in
        # `keys`.
        sig do
          params(
            option: T.anything,
            keys: T::Array[Symbol],
            name: String,
            expected: String
          ).returns(T::Hash[Symbol, T.anything])
        end
        private def option_hash(option, keys, name, expected)
        end

        # @api private
        #
        # The option can hold a tracer provider or content, so an error message shows a
        # value only when it is a plain one, and its class otherwise.
        sig { params(value: T.anything).returns(String) }
        private def plain(value)
        end

        # @api private
        #
        # The `open_telemetry` option that the environment variables stand for. Only
        # `false`, in any case, turns the spans or the propagation off.
        sig { returns(T::Hash[Symbol, T.anything]) }
        private def environment_option
        end

        # @api private
        #
        # Anything but `content`, in any case, is `:metadata_only`.
        sig { returns(Symbol) }
        private def environment_content_mode
        end

        # @api private
        #
        # `nil` unless the variable is a whole number of 1 or more, in decimal digits.
        sig { returns(T.nilable(Integer)) }
        private def environment_max_content_bytes
        end

        # @api private
        sig do
          params(span: T.anything, result: T::Hash[Symbol, T.anything]).void
        end
        private def set_response_status_code(span, result)
        end

        # @api private
        #
        # `span_created_id` names the attribute for the created object's `id`, or, as
        # `{"<attribute>" => :user_id}`, for another of its fields.
        sig do
          params(span: T.anything, result: T::Hash[Symbol, T.anything]).void
        end
        private def set_created_id(span, result)
        end

        # @api private
        sig do
          params(span: T.anything, result: T::Hash[Symbol, T.anything]).void
        end
        private def set_response_header_attributes(span, result)
        end

        # @api private
        sig do
          params(span: T.anything, result: T::Hash[Symbol, T.anything]).void
        end
        private def record_result(span, result)
        end

        # @api private
        sig do
          params(span_name: T.nilable(String)).returns(T::Array[T.anything])
        end
        private def recorders(span_name)
        end

        # @api private
        #
        # A failure to trace must not fail the API call, so an error raised in the block,
        # such as one from a span processor of the application, is logged, and the value
        # is then `nil`.
        sig do
          params(
            span_name: T.nilable(String),
            blk: T.proc.returns(T.anything)
          ).returns(T.anything)
        end
        private def recording(span_name, &blk)
        end

        # @api private
        #
        # `url.query` and `url.full` keep only the pairs whose name the endpoint defines
        # (`query_names`, or one of them followed by `[]`), so none that the application
        # added. Both are left out when a kept pair is content
        # ({CONTENT_QUERY_PARAMETERS}, `content_names`) and the client's spans have none.
        sig do
          params(
            client: Anthropic::Internal::Transport::BaseClient,
            url: URI::Generic,
            query_names: T::Array[String],
            content_names: T::Array[String]
          ).returns(T::Hash[String, String])
        end
        private def url_attributes(client, url, query_names, content_names)
        end

        # @api private
        sig do
          params(
            client: Anthropic::Internal::Transport::BaseClient,
            req: T::Hash[Symbol, T.anything]
          ).returns(T::Hash[String, T.anything])
        end
        private def request_attributes(client, req)
        end

        # @api private
        sig do
          params(data: T.anything, path: T::Array[Symbol]).returns(T.anything)
        end
        private def dig(data, path)
        end

        # @api private
        #
        # `nil` for a value of another type than `type`, so that a response this SDK
        # version does not know sets no attribute rather than a wrong one.
        sig do
          params(
            value: T.anything,
            type: T.any(Symbol, T::Array[Symbol])
          ).returns(T.anything)
        end
        private def attribute_value(value, type)
        end

        # @api private
        sig do
          params(
            value: T.nilable(String),
            type: T.any(Symbol, T::Array[Symbol])
          ).returns(T.anything)
        end
        private def header_value(value, type)
        end

        # @api private
        #
        # The first iteration ends `span` exactly once, however the read ends: `OK` when
        # exhausted, `ERROR` when it fails, unset when the application closes it early.
        # Server-sent events have no end that this code knows, so the server ending them
        # (`events`) sets no status: whoever knows their end event does. A later iteration
        # reads `source` as is, without touching the span.
        sig do
          params(
            source: T::Enumerator[T.anything],
            span: T.anything,
            events: T::Boolean
          ).returns(T::Enumerator[T.anything])
        end
        private def iterate_and_end_span(source, span, events)
        end

        # @api private
        sig { params(error: StandardError).returns(String) }
        private def error_type(error)
        end
      end
    end
  end
end
