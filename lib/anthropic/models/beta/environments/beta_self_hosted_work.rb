# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        # @see Anthropic::Resources::Beta::Environments::Work#retrieve
        class BetaSelfHostedWork < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Work identifier (e.g., 'work\_...')
          #
          #   @return [String]
          required :id, String

          # @!attribute acknowledged_at
          #   RFC 3339 timestamp when the work item was acknowledged and assigned to a
          #   self-hosted sandbox
          #
          #   @return [String, nil]
          required :acknowledged_at, String, nil?: true

          # @!attribute created_at
          #   RFC 3339 timestamp when work was created
          #
          #   @return [String]
          required :created_at, String

          # @!attribute data
          #   The actual work to be performed
          #
          #   @return [Anthropic::Models::Beta::Environments::BetaSessionWorkData]
          required :data, -> { Anthropic::Beta::Environments::BetaSessionWorkData }

          # @!attribute environment_id
          #   Environment identifier this work belongs to (e.g., `env_...`)
          #
          #   @return [String]
          required :environment_id, String

          # @!attribute latest_heartbeat_at
          #   RFC 3339 timestamp of the most recent heartbeat
          #
          #   @return [String, nil]
          required :latest_heartbeat_at, String, nil?: true

          # @!attribute metadata
          #   User-provided metadata key-value pairs associated with this work item
          #
          #   @return [Hash{Symbol=>String}]
          required :metadata, Anthropic::Internal::Type::HashOf[String]

          # @!attribute secret
          #   Credential payload used by the environment worker to execute this work item. May
          #   be populated when polling for work; null on all other retrieval paths.
          #
          #   @return [String, nil]
          required :secret, String, nil?: true

          # @!attribute started_at
          #   RFC 3339 timestamp when work execution started
          #
          #   @return [String, nil]
          required :started_at, String, nil?: true

          # @!attribute state
          #   Current state of the work item
          #
          #   @return [Symbol, Anthropic::Models::Beta::Environments::BetaSelfHostedWork::State]
          required :state, enum: -> { Anthropic::Beta::Environments::BetaSelfHostedWork::State }

          # @!attribute stop_requested_at
          #   RFC 3339 timestamp when stop was requested
          #
          #   @return [String, nil]
          required :stop_requested_at, String, nil?: true

          # @!attribute stopped_at
          #   RFC 3339 timestamp when work execution stopped
          #
          #   @return [String, nil]
          required :stopped_at, String, nil?: true

          # @!attribute type
          #   The type of object (always 'work')
          #
          #   @return [Symbol, :work]
          required :type, const: :work

          # @!method initialize(id:, acknowledged_at:, created_at:, data:, environment_id:, latest_heartbeat_at:, metadata:, secret:, started_at:, state:, stop_requested_at:, stopped_at:, type: :work)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Environments::BetaSelfHostedWork} for more details.
          #
          #   Work resource representing a unit of work in a self-hosted environment.
          #
          #   Work items are queued when sessions are created or when long-dormant sessions
          #   receive new messages. The environment worker polls for work to execute in a
          #   self-hosted sandbox.
          #
          #   @param id [String] Work identifier (e.g., 'work\_...')
          #
          #   @param acknowledged_at [String, nil] RFC 3339 timestamp when the work item was acknowledged and assigned to a self-ho
          #
          #   @param created_at [String] RFC 3339 timestamp when work was created
          #
          #   @param data [Anthropic::Models::Beta::Environments::BetaSessionWorkData] The actual work to be performed
          #
          #   @param environment_id [String] Environment identifier this work belongs to (e.g., `env_...`)
          #
          #   @param latest_heartbeat_at [String, nil] RFC 3339 timestamp of the most recent heartbeat
          #
          #   @param metadata [Hash{Symbol=>String}] User-provided metadata key-value pairs associated with this work item
          #
          #   @param secret [String, nil] Credential payload used by the environment worker to execute this work item. May
          #
          #   @param started_at [String, nil] RFC 3339 timestamp when work execution started
          #
          #   @param state [Symbol, Anthropic::Models::Beta::Environments::BetaSelfHostedWork::State] Current state of the work item
          #
          #   @param stop_requested_at [String, nil] RFC 3339 timestamp when stop was requested
          #
          #   @param stopped_at [String, nil] RFC 3339 timestamp when work execution stopped
          #
          #   @param type [Symbol, :work] The type of object (always 'work')

          # Current state of the work item
          #
          # @see Anthropic::Models::Beta::Environments::BetaSelfHostedWork#state
          module State
            extend Anthropic::Internal::Type::Enum

            QUEUED = :queued
            STARTING = :starting
            ACTIVE = :active
            STOPPING = :stopping
            STOPPED = :stopped

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
