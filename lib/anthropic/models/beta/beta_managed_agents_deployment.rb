# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Deployments#create
      class BetaManagedAgentsDeployment < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this deployment.
        #
        #   @return [String]
        required :id, String

        # @!attribute agent
        #   A resolved agent reference with a concrete version.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentReference]
        required :agent, -> { Anthropic::Beta::BetaManagedAgentsAgentReference }

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

        # @!attribute description
        #   Description of what the deployment does.
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute environment_id
        #   ID of the `environment` where sessions run.
        #
        #   @return [String]
        required :environment_id, String

        # @!attribute initial_events
        #   Events sent to each session immediately after creation.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent>]
        required :initial_events,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent] }

        # @!attribute metadata
        #   Arbitrary key-value metadata. Maximum 16 pairs.
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute name
        #   Human-readable name.
        #
        #   @return [String]
        required :name, String

        # @!attribute paused_reason
        #   Why a deployment is paused. Non-null exactly when `status` is `paused`.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason, Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason, nil]
        required :paused_reason,
                 union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason },
                 nil?: true

        # @!attribute resources
        #   Resources attached to sessions created from this deployment. Echoes the input
        #   minus write-only credentials.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsFileResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig>]
        required :resources,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig] }

        # @!attribute schedule
        #   5-field POSIX cron schedule with computed runtime timestamps.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSchedule, nil]
        required :schedule, -> { Anthropic::Beta::BetaManagedAgentsSchedule }, nil?: true

        # @!attribute status
        #   Lifecycle status of a deployment.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentStatus]
        required :status, enum: -> { Anthropic::Beta::BetaManagedAgentsDeploymentStatus }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeployment::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeployment::Type }

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute vault_ids
        #   Vault IDs supplying stored credentials for sessions created from this
        #   deployment.
        #
        #   @return [Array<String>]
        required :vault_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, agent:, archived_at:, created_at:, description:, environment_id:, initial_events:, metadata:, name:, paused_reason:, resources:, schedule:, status:, type:, updated_at:, vault_ids:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeployment} for more details.
        #
        #   A deployment is a configured instance of an agent — it binds the agent to
        #   everything needed to run it autonomously: an environment, credentials, initial
        #   events, and an optional schedule.
        #
        #   @param id [String] Unique identifier for this deployment.
        #
        #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsAgentReference] A resolved agent reference with a concrete version.
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param description [String, nil] Description of what the deployment does.
        #
        #   @param environment_id [String] ID of the `environment` where sessions run.
        #
        #   @param initial_events [Array<Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent>] Events sent to each session immediately after creation.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata. Maximum 16 pairs.
        #
        #   @param name [String] Human-readable name.
        #
        #   @param paused_reason [Anthropic::Models::Beta::BetaManagedAgentsManualDeploymentPausedReason, Anthropic::Models::Beta::BetaManagedAgentsErrorDeploymentPausedReason, nil] Why a deployment is paused. Non-null exactly when `status` is `paused`.
        #
        #   @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsFileResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig>] Resources attached to sessions created from this deployment. Echoes the input mi
        #
        #   @param schedule [Anthropic::Models::Beta::BetaManagedAgentsSchedule, nil] 5-field POSIX cron schedule with computed runtime timestamps.
        #
        #   @param status [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentStatus] Lifecycle status of a deployment.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeployment::Type]
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param vault_ids [Array<String>] Vault IDs supplying stored credentials for sessions created from this deployment

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeployment#type
        module Type
          extend Anthropic::Internal::Type::Enum

          DEPLOYMENT = :deployment

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeployment = Beta::BetaManagedAgentsDeployment
  end
end
