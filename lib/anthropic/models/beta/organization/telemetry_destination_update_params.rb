# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations#update
        class TelemetryDestinationUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute destination_id
          #   ID of the destination (`tdst_...`).
          #
          #   @return [String]
          required :destination_id, String

          # @!attribute display_name
          #   New human-readable name, 1 to 255 characters. Null clears it.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!attribute endpoint_url
          #   The new base URL of the destination's OTLP/HTTP endpoint. The same rules as on
          #   create apply.
          #
          #   A change of hostname or port first removes every registered header, so send the
          #   headers for the new endpoint in the same request. When the destination has a
          #   `traces.endpoint_url`, such a change must also set `traces.endpoint_url` to a
          #   URL with the new hostname and port, or to `null`. A change of the path alone
          #   keeps the headers.
          #
          #   @return [String, nil]
          optional :endpoint_url, String

          # @!attribute headers
          #   Headers to set or remove. The API merges them into the destination's headers by
          #   name.
          #
          #   Names compare case-insensitively. A string value sets or replaces that header. A
          #   `null` value removes it. Headers that you omit don't change. The field itself
          #   can't be `null`.
          #
          #   A request that sets a header value must also include `endpoint_url`. The current
          #   URL is accepted.
          #
          #   The resulting set must stay within the same limits as on create. When the
          #   request sets a value, each stored value that it doesn't set counts as 4,096
          #   bytes toward the 16,384-byte limit, because you can't read its real length. So
          #   to change one header of a destination that has four or more other headers, send
          #   the values of the others again in the same request.
          #
          #   @return [Hash{Symbol=>String, nil}, nil]
          optional :headers, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

          # @!attribute state
          #   Whether the destination receives deliveries after the update. The field can't be
          #   `null`.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabledParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabledParams, nil]
          optional :state, union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationStateParams }

          # @!attribute traces
          #   The traces settings to change. Omitted settings keep their stored values.
          #
          #   `null` sets every traces setting to its create default.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams, nil]
          optional :traces,
                   -> {
                     Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams
                   },
                   nil?: true

          # @!attribute workspaces
          #   The new workspace scope, in the same form as on create. The field can't be
          #   `null`.
          #
          #   The API refuses an update that changes the type or sends `workspace_ids` while
          #   the destination's list has more than 750 workspaces. Remove workspaces one at a
          #   time until 750 or fewer remain, then send the update again.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams, nil]
          optional :workspaces,
                   union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams }

          # @!attribute betas
          #   This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #   in this header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(destination_id:, display_name: nil, endpoint_url: nil, headers: nil, state: nil, traces: nil, workspaces: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::TelemetryDestinationUpdateParams} for
          #   more details.
          #
          #   @param destination_id [String] ID of the destination (`tdst_...`).
          #
          #   @param display_name [String, nil] New human-readable name, 1 to 255 characters. Null clears it.
          #
          #   @param endpoint_url [String] The new base URL of the destination's OTLP/HTTP endpoint. The same rules as on c
          #
          #   @param headers [Hash{Symbol=>String, nil}, nil] Headers to set or remove. The API merges them into the destination's headers by
          #
          #   @param state [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateEnabledParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationStateDisabledParams] Whether the destination receives deliveries after the update. The field can't be
          #
          #   @param traces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams, nil] The traces settings to change. Omitted settings keep their stored values.
          #
          #   @param workspaces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams] The new workspace scope, in the same form as on create. The field can't be `null
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
