# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class TelemetryDestinationCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::TelemetryDestinationCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The base URL of your collector's OTLP/HTTP endpoint, for example
          # `https://gateway.example.com`.
          #
          # The URL must use `https` and a hostname, not an IP address. The port, if given,
          # must be 443. The URL must not contain a query string, a fragment, or a username
          # and password. At most 2,048 characters.
          #
          # A path prefix, such as `/otlp`, is allowed. Don't include the per-signal path
          # (`/v1/traces`), because the API appends it on delivery. If your collector takes
          # traces on another path, also set `traces.endpoint_url`.
          sig { returns(String) }
          attr_accessor :endpoint_url

          # Which of the organization's workspaces the destination covers.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams,
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams
              )
            )
          end
          attr_accessor :workspaces

          # Human-readable name for the destination. Optional. 1 to 255 characters.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # Request headers that the API sends with every delivery, typically your
          # collector's authentication header (for example `authorization`).
          #
          # The API stores the values encrypted and never returns them. Reads show only
          # `header_names`.
          #
          # At most 20 headers. Names are at most 128 characters. Two names can't differ
          # only in case. Values are printable ASCII, at most 4,096 characters, and can't
          # begin or end with a space. Names and values together are at most 16,384 bytes.
          #
          # Reserved names are rejected, for example `host`, `cookie`, `user-agent`, and
          # names that start with `content-`, `proxy-`, `x-forwarded-`, or `anthropic-`. For
          # this check, `_` in a name counts as `-`.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :headers

          sig { params(headers: T::Hash[Symbol, String]).void }
          attr_writer :headers

          # The settings for the traces that the destination receives. If you leave it out,
          # every setting takes its default.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams
              )
            )
          end
          attr_reader :traces

          sig do
            params(
              traces:
                Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams::OrHash
            ).void
          end
          attr_writer :traces

          # This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          # in this header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              endpoint_url: String,
              workspaces:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams::OrHash
                ),
              display_name: T.nilable(String),
              headers: T::Hash[Symbol, String],
              traces:
                Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams::OrHash,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The base URL of your collector's OTLP/HTTP endpoint, for example
            # `https://gateway.example.com`.
            #
            # The URL must use `https` and a hostname, not an IP address. The port, if given,
            # must be 443. The URL must not contain a query string, a fragment, or a username
            # and password. At most 2,048 characters.
            #
            # A path prefix, such as `/otlp`, is allowed. Don't include the per-signal path
            # (`/v1/traces`), because the API appends it on delivery. If your collector takes
            # traces on another path, also set `traces.endpoint_url`.
            endpoint_url:,
            # Which of the organization's workspaces the destination covers.
            workspaces:,
            # Human-readable name for the destination. Optional. 1 to 255 characters.
            display_name: nil,
            # Request headers that the API sends with every delivery, typically your
            # collector's authentication header (for example `authorization`).
            #
            # The API stores the values encrypted and never returns them. Reads show only
            # `header_names`.
            #
            # At most 20 headers. Names are at most 128 characters. Two names can't differ
            # only in case. Values are printable ASCII, at most 4,096 characters, and can't
            # begin or end with a space. Names and values together are at most 16,384 bytes.
            #
            # Reserved names are rejected, for example `host`, `cookie`, `user-agent`, and
            # names that start with `content-`, `proxy-`, `x-forwarded-`, or `anthropic-`. For
            # this check, `_` in a name counts as `-`.
            headers: nil,
            # The settings for the traces that the destination receives. If you leave it out,
            # every setting takes its default.
            traces: nil,
            # This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
            # in this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                endpoint_url: String,
                workspaces:
                  T.any(
                    Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams,
                    Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams,
                    Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams
                  ),
                display_name: T.nilable(String),
                headers: T::Hash[Symbol, String],
                traces:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
