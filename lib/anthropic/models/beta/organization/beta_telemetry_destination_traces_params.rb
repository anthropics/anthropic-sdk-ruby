# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTracesParams < Anthropic::Internal::Type::BaseModel
          # @!attribute content_mode
          #   What the exported spans contain. Defaults to `metadata_only` on create.
          #
          #   On update, `null` sets `metadata_only`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationContentMode, nil]
          optional :content_mode,
                   enum: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode },
                   nil?: true

          # @!attribute enabled
          #   Whether the destination receives traces. Defaults to true on create. It cannot
          #   be null.
          #
          #   @return [Boolean, nil]
          optional :enabled, Anthropic::Internal::Type::Boolean

          # @!attribute endpoint_url
          #   The full URL of your collector's traces endpoint, for a collector that takes
          #   traces on a path other than `/v1/traces`. The API posts traces to it exactly as
          #   given and appends nothing.
          #
          #   The same rules as for `endpoint_url` apply, except that any path is allowed. It
          #   must have the same scheme, host, and port as `endpoint_url`. At most 2,048
          #   characters.
          #
          #   On create, `null` is the same as leaving it out. On update, `null` removes it.
          #   The API then posts traces to `endpoint_url` with `/v1/traces` appended. A change
          #   of this URL alone keeps the registered headers.
          #
          #   @return [String, nil]
          optional :endpoint_url, String, nil?: true

          # @!attribute max_content_bytes
          #   The most bytes of content that one exported span can contain, from 1 up to the
          #   API's maximum. `null` sets no bound, so only the API's maximum applies.
          #
          #   On create, leaving it out is the same as `null`. The error for a value above the
          #   maximum states the maximum.
          #
          #   @return [Integer, nil]
          optional :max_content_bytes, Integer, nil?: true

          # @!method initialize(content_mode: nil, enabled: nil, endpoint_url: nil, max_content_bytes: nil)
          #   The settings for the traces that a telemetry destination receives, as a create
          #   or update request sets them. An omitted field takes its default on create and
          #   keeps its stored value on update.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams}
          #   for more details.
          #
          #   @param content_mode [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationContentMode, nil] What the exported spans contain. Defaults to `metadata_only` on create.
          #
          #   @param enabled [Boolean] Whether the destination receives traces. Defaults to true on create. It cannot b
          #
          #   @param endpoint_url [String, nil] The full URL of your collector's traces endpoint, for a collector that takes tra
          #
          #   @param max_content_bytes [Integer, nil] The most bytes of content that one exported span can contain, from 1 up to the A
        end
      end
    end
  end
end
