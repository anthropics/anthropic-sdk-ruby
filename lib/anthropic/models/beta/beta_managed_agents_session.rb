# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Sessions#create
      class BetaManagedAgentsSession < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute agent
        #   Resolved `agent` definition for a `session`. Snapshot of the `agent` at
        #   `session` creation time.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionAgent]
        required :agent, -> { Anthropic::Beta::BetaManagedAgentsSessionAgent }

        # @!attribute archived_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute environment_id
        #
        #   @return [String]
        required :environment_id, String

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute resources
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource>]
        required :resources,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource] }

        # @!attribute stats
        #   Timing statistics for a session.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionStats]
        required :stats, -> { Anthropic::Beta::BetaManagedAgentsSessionStats }

        # @!attribute status
        #   SessionStatus enum
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSession::Status]
        required :status, enum: -> { Anthropic::Beta::BetaManagedAgentsSession::Status }

        # @!attribute title
        #
        #   @return [String, nil]
        required :title, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSession::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSession::Type }

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute usage
        #   Cumulative token usage for a session across all turns.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionUsage]
        required :usage, -> { Anthropic::Beta::BetaManagedAgentsSessionUsage }

        # @!attribute vault_ids
        #   Vault IDs attached to the session at creation. Empty when no vaults were
        #   supplied.
        #
        #   @return [Array<String>]
        required :vault_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, agent:, archived_at:, created_at:, environment_id:, metadata:, resources:, stats:, status:, title:, type:, updated_at:, usage:, vault_ids:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSession} for more details.
        #
        #   A Managed Agents `session`.
        #
        #   @param id [String]
        #
        #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsSessionAgent] Resolved `agent` definition for a `session`. Snapshot of the `agent` at `session
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param environment_id [String]
        #
        #   @param metadata [Hash{Symbol=>String}]
        #
        #   @param resources [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource>]
        #
        #   @param stats [Anthropic::Models::Beta::BetaManagedAgentsSessionStats] Timing statistics for a session.
        #
        #   @param status [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSession::Status] SessionStatus enum
        #
        #   @param title [String, nil]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSession::Type]
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param usage [Anthropic::Models::Beta::BetaManagedAgentsSessionUsage] Cumulative token usage for a session across all turns.
        #
        #   @param vault_ids [Array<String>] Vault IDs attached to the session at creation. Empty when no vaults were supplie

        # SessionStatus enum
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsSession#status
        module Status
          extend Anthropic::Internal::Type::Enum

          RESCHEDULING = :rescheduling
          RUNNING = :running
          IDLE = :idle
          TERMINATED = :terminated

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsSession#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION = :session

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSession = Beta::BetaManagedAgentsSession
  end
end
