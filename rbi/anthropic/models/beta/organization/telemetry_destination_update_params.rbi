# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class TelemetryDestinationUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::TelemetryDestinationUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the destination (`tdst_...`).
          sig { returns(String) }
          attr_accessor :destination_id

          # New human-readable name, 1 to 255 characters. Null clears it.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # The new base URL of the destination's OTLP/HTTP endpoint. The same rules as on
          # create apply.
          #
          # A change of hostname or port first removes every registered header, so send the
          # headers for the new endpoint in the same request. When the destination has a
          # `traces.endpoint_url`, such a change must also set `traces.endpoint_url` to a
          # URL with the new hostname and port, or to `null`. A change of the path alone
          # keeps the headers.
          sig { returns(T.nilable(String)) }
          attr_reader :endpoint_url

          sig { params(endpoint_url: String).void }
          attr_writer :endpoint_url

          # Headers to set or remove. The API merges them into the destination's headers by
          # name.
          #
          # Names compare case-insensitively. A string value sets or replaces that header. A
          # `null` value removes it. Headers that you omit don't change. The field itself
          # can't be `null`.
          #
          # A request that sets a header value must also include `endpoint_url`. The current
          # URL is accepted.
          #
          # The resulting set must stay within the same limits as on create. When the
          # request sets a value, each stored value that it doesn't set counts as 4,096
          # bytes toward the 16,384-byte limit, because you can't read its real length. So
          # to change one header of a destination that has four or more other headers, send
          # the values of the others again in the same request.
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
          attr_accessor :headers

          # Whether the destination receives deliveries after the update. The field can't be
          # `null`.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams
                )
              )
            )
          end
          attr_reader :state

          sig do
            params(
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams::OrHash
                )
            ).void
          end
          attr_writer :state

          # The traces settings to change. Omitted settings keep their stored values.
          #
          # `null` sets every traces setting to its create default.
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
                T.nilable(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams::OrHash
                )
            ).void
          end
          attr_writer :traces

          # The new workspace scope, in the same form as on create. The field can't be
          # `null`.
          #
          # The API refuses an update that changes the type or sends `workspace_ids` while
          # the destination's list has more than 750 workspaces. Remove workspaces one at a
          # time until 750 or fewer remain, then send the update again.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams
                )
              )
            )
          end
          attr_reader :workspaces

          sig do
            params(
              workspaces:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams::OrHash
                )
            ).void
          end
          attr_writer :workspaces

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
              destination_id: String,
              display_name: T.nilable(String),
              endpoint_url: String,
              headers: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams::OrHash
                ),
              traces:
                T.nilable(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams::OrHash
                ),
              workspaces:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams::OrHash
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the destination (`tdst_...`).
            destination_id:,
            # New human-readable name, 1 to 255 characters. Null clears it.
            display_name: nil,
            # The new base URL of the destination's OTLP/HTTP endpoint. The same rules as on
            # create apply.
            #
            # A change of hostname or port first removes every registered header, so send the
            # headers for the new endpoint in the same request. When the destination has a
            # `traces.endpoint_url`, such a change must also set `traces.endpoint_url` to a
            # URL with the new hostname and port, or to `null`. A change of the path alone
            # keeps the headers.
            endpoint_url: nil,
            # Headers to set or remove. The API merges them into the destination's headers by
            # name.
            #
            # Names compare case-insensitively. A string value sets or replaces that header. A
            # `null` value removes it. Headers that you omit don't change. The field itself
            # can't be `null`.
            #
            # A request that sets a header value must also include `endpoint_url`. The current
            # URL is accepted.
            #
            # The resulting set must stay within the same limits as on create. When the
            # request sets a value, each stored value that it doesn't set counts as 4,096
            # bytes toward the 16,384-byte limit, because you can't read its real length. So
            # to change one header of a destination that has four or more other headers, send
            # the values of the others again in the same request.
            headers: nil,
            # Whether the destination receives deliveries after the update. The field can't be
            # `null`.
            state: nil,
            # The traces settings to change. Omitted settings keep their stored values.
            #
            # `null` sets every traces setting to its create default.
            traces: nil,
            # The new workspace scope, in the same form as on create. The field can't be
            # `null`.
            #
            # The API refuses an update that changes the type or sends `workspace_ids` while
            # the destination's list has more than 750 workspaces. Remove workspaces one at a
            # time until 750 or fewer remain, then send the update again.
            workspaces: nil,
            # This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
            # in this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                destination_id: String,
                display_name: T.nilable(String),
                endpoint_url: String,
                headers: T.nilable(T::Hash[Symbol, T.nilable(String)]),
                state:
                  T.any(
                    Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams,
                    Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams
                  ),
                traces:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams
                  ),
                workspaces:
                  T.any(
                    Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams,
                    Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams,
                    Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams
                  ),
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
