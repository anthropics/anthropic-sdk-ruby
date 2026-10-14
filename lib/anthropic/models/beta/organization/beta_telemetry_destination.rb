# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations#create
        class BetaTelemetryDestination < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The unique ID of the destination (`tdst_...`).
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   Time the destination was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute delivery_health
          #   The most recent delivery results for this destination.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDeliveryHealth]
          required :delivery_health, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth }

          # @!attribute display_name
          #   Human-readable name for the destination. Null when none was set.
          #
          #   @return [String, nil]
          required :display_name, String, nil?: true

          # @!attribute endpoint_url
          #   The base URL of the destination's OTLP/HTTP endpoint, exactly as registered.
          #
          #   The API appends the per-signal path, such as `/v1/traces`, on delivery, unless
          #   `traces.endpoint_url` is set.
          #
          #   @return [String]
          required :endpoint_url, String

          # @!attribute header_names
          #   Names of the registered request headers. Header values are write-only and are
          #   never returned.
          #
          #   @return [Array<String>]
          required :header_names, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute state
          #   Whether the destination receives deliveries.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabled, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabled]
          required :state, union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationState }

          # @!attribute traces
          #   The destination's settings for the traces it receives.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTraces]
          required :traces, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationTraces }

          # @!attribute type
          #
          #   @return [Symbol, :telemetry_destination]
          required :type, const: :telemetry_destination

          # @!attribute updated_at
          #   Time of the last change to the destination's configuration or state. Changes to
          #   `delivery_health` don't change it.
          #
          #   An update that sets a header value always changes it, even when the value is the
          #   same as before. Adding or removing a single workspace on the destination's list
          #   doesn't change it. An update that changes the list does.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute workspaces
          #   Which of the organization's workspaces the destination covers.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAll, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude]
          required :workspaces, union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces }

          # @!method initialize(id:, created_at:, delivery_health:, display_name:, endpoint_url:, header_names:, state:, traces:, updated_at:, workspaces:, type: :telemetry_destination)
          #   An OpenTelemetry destination: an OTLP/HTTP endpoint, the request headers sent
          #   with every delivery to it, what the exported spans contain, and which workspaces
          #   it covers. A destination belongs to an organization. A workspace's spans go to
          #   every enabled destination that covers it.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestination} for more
          #   details.
          #
          #   @param id [String] The unique ID of the destination (`tdst_...`).
          #
          #   @param created_at [Time] Time the destination was created.
          #
          #   @param delivery_health [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDeliveryHealth] The most recent delivery results for this destination.
          #
          #   @param display_name [String, nil] Human-readable name for the destination. Null when none was set.
          #
          #   @param endpoint_url [String] The base URL of the destination's OTLP/HTTP endpoint, exactly as registered.
          #
          #   @param header_names [Array<String>] Names of the registered request headers. Header values are write-only and are ne
          #
          #   @param state [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabled, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabled] Whether the destination receives deliveries.
          #
          #   @param traces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTraces] The destination's settings for the traces it receives.
          #
          #   @param updated_at [Time] Time of the last change to the destination's configuration or state. Changes to
          #
          #   @param workspaces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAll, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude] Which of the organization's workspaces the destination covers.
          #
          #   @param type [Symbol, :telemetry_destination]
        end
      end
    end
  end
end
