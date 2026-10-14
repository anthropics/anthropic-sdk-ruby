# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTraces < Anthropic::Internal::Type::BaseModel
          # @!attribute content_mode
          #   What the exported spans contain.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationContentMode]
          required :content_mode, enum: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode }

          # @!attribute enabled
          #   Whether the destination receives traces. A destination whose `enabled` is false
          #   keeps its other settings.
          #
          #   @return [Boolean]
          required :enabled, Anthropic::Internal::Type::Boolean

          # @!attribute endpoint_url
          #   The full URL that the API posts traces to, exactly as registered, or `null` if
          #   the destination doesn't have one.
          #
          #   When it is `null`, the API posts traces to `endpoint_url` with `/v1/traces`
          #   appended.
          #
          #   @return [String, nil]
          required :endpoint_url, String, nil?: true

          # @!attribute max_content_bytes
          #   The most bytes of content that one exported span can contain, or `null` if only
          #   the API's maximum applies.
          #
          #   Content means model prompts and responses, and tool inputs and outputs. The API
          #   shortens longer content to this size before it delivers the span. A destination
          #   whose `content_mode` is `metadata_only` keeps this value. It applies once
          #   `content_mode` is `content`.
          #
          #   @return [Integer, nil]
          required :max_content_bytes, Integer, nil?: true

          # @!method initialize(content_mode:, enabled:, endpoint_url:, max_content_bytes:)
          #   A telemetry destination's settings for the traces it receives.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTraces} for more
          #   details.
          #
          #   @param content_mode [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationContentMode] What the exported spans contain.
          #
          #   @param enabled [Boolean] Whether the destination receives traces. A destination whose `enabled` is false
          #
          #   @param endpoint_url [String, nil] The full URL that the API posts traces to, exactly as registered, or `null` if t
          #
          #   @param max_content_bytes [Integer, nil] The most bytes of content that one exported span can contain, or `null` if only
        end
      end
    end
  end
end
