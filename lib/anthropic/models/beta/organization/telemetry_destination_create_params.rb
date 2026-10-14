# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations#create
        class TelemetryDestinationCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute endpoint_url
          #   The base URL of your collector's OTLP/HTTP endpoint, for example
          #   `https://gateway.example.com`.
          #
          #   The URL must use `https` and a hostname, not an IP address. The port, if given,
          #   must be 443. The URL must not contain a query string, a fragment, or a username
          #   and password. At most 2,048 characters.
          #
          #   A path prefix, such as `/otlp`, is allowed. Don't include the per-signal path
          #   (`/v1/traces`), because the API appends it on delivery. If your collector takes
          #   traces on another path, also set `traces.endpoint_url`.
          #
          #   @return [String]
          required :endpoint_url, String

          # @!attribute workspaces
          #   Which of the organization's workspaces the destination covers.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams]
          required :workspaces,
                   union: -> { Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesParams }

          # @!attribute display_name
          #   Human-readable name for the destination. Optional. 1 to 255 characters.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!attribute headers
          #   Request headers that the API sends with every delivery, typically your
          #   collector's authentication header (for example `authorization`).
          #
          #   The API stores the values encrypted and never returns them. Reads show only
          #   `header_names`.
          #
          #   At most 20 headers. Names are at most 128 characters. Two names can't differ
          #   only in case. Values are printable ASCII, at most 4,096 characters, and can't
          #   begin or end with a space. Names and values together are at most 16,384 bytes.
          #
          #   Reserved names are rejected, for example `host`, `cookie`, `user-agent`, and
          #   names that start with `content-`, `proxy-`, `x-forwarded-`, or `anthropic-`. For
          #   this check, `_` in a name counts as `-`.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :headers, Anthropic::Internal::Type::HashOf[String]

          # @!attribute traces
          #   The settings for the traces that the destination receives. If you leave it out,
          #   every setting takes its default.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams, nil]
          optional :traces, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(endpoint_url:, workspaces:, display_name: nil, headers: nil, traces: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::TelemetryDestinationCreateParams} for
          #   more details.
          #
          #   @param endpoint_url [String] The base URL of your collector's OTLP/HTTP endpoint, for example `https://gatewa
          #
          #   @param workspaces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams] Which of the organization's workspaces the destination covers.
          #
          #   @param display_name [String, nil] Human-readable name for the destination. Optional. 1 to 255 characters.
          #
          #   @param headers [Hash{Symbol=>String}] Request headers that the API sends with every delivery, typically your collector
          #
          #   @param traces [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationTracesParams] The settings for the traces that the destination receives. If you leave it out,
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
