# typed: strong

module Anthropic
  module Resources
    class Beta
      class Sessions
        sig { returns(Anthropic::Resources::Beta::Sessions::Events) }
        attr_reader :events

        sig { returns(Anthropic::Resources::Beta::Sessions::Resources) }
        attr_reader :resources

        sig { returns(Anthropic::Resources::Beta::Sessions::Threads) }
        attr_reader :threads

        # Create Session
        sig do
          params(
            agent:
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash
              ),
            environment_id: String,
            metadata: T::Hash[Symbol, String],
            resources:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsFileResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::OrHash
                )
              ],
            title: T.nilable(String),
            vault_ids: T::Array[String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsSession)
        end
        def create(
          # Body param: Agent identifier. Accepts the `agent` ID string, which pins the
          # latest version for the session, or an `agent` object with both id and version
          # specified.
          agent:,
          # Body param: ID of the `environment` defining the container configuration for
          # this session.
          environment_id:,
          # Body param: Arbitrary key-value metadata attached to the session. Maximum 16
          # pairs, keys up to 64 chars, values up to 512 chars.
          metadata: nil,
          # Body param: Resources (e.g. repositories, files) to mount into the session's
          # container.
          resources: nil,
          # Body param: Human-readable session title.
          title: nil,
          # Body param: Vault IDs for stored credentials the agent can use during the
          # session.
          vault_ids: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get Session
        sig do
          params(
            session_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsSession)
        end
        def retrieve(
          # Path parameter session_id
          session_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update Session
        sig do
          params(
            session_id: String,
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            title: T.nilable(String),
            vault_ids: T::Array[String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsSession)
        end
        def update(
          # Path param: Path parameter session_id
          session_id,
          # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
          # delete it. Omit the field to preserve.
          metadata: nil,
          # Body param: Human-readable session title.
          title: nil,
          # Body param: Vault IDs (`vlt_*`) to attach to the session. Not yet supported;
          # requests setting this field are rejected. Reserved for future use.
          vault_ids: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List Sessions
        sig do
          params(
            agent_id: String,
            agent_version: Integer,
            created_at_gt: Time,
            created_at_gte: Time,
            created_at_lt: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            memory_store_id: String,
            order: Anthropic::Beta::SessionListParams::Order::OrSymbol,
            page: String,
            statuses:
              T::Array[Anthropic::Beta::SessionListParams::Status::OrSymbol],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsSession
            ]
          )
        end
        def list(
          # Query param: Filter sessions created with this agent ID.
          agent_id: nil,
          # Query param: Filter by agent version. Only applies when agent_id is also set.
          agent_version: nil,
          # Query param: Return sessions created after this time (exclusive).
          created_at_gt: nil,
          # Query param: Return sessions created at or after this time (inclusive).
          created_at_gte: nil,
          # Query param: Return sessions created before this time (exclusive).
          created_at_lt: nil,
          # Query param: Return sessions created at or before this time (inclusive).
          created_at_lte: nil,
          # Query param: When true, includes archived sessions. Default: false (exclude
          # archived).
          include_archived: nil,
          # Query param: Maximum number of results to return.
          limit: nil,
          # Query param: Filter sessions whose resources contain a memory_store with this
          # memory store ID.
          memory_store_id: nil,
          # Query param: Sort direction for results, ordered by created_at. Defaults to desc
          # (newest first).
          order: nil,
          # Query param: Opaque pagination cursor from a previous response's next_page.
          page: nil,
          # Query param: Filter by session status. Repeat the parameter to match any of
          # multiple statuses.
          statuses: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Delete Session
        sig do
          params(
            session_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeletedSession)
        end
        def delete(
          # Path parameter session_id
          session_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive Session
        sig do
          params(
            session_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsSession)
        end
        def archive(
          # Path parameter session_id
          session_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
