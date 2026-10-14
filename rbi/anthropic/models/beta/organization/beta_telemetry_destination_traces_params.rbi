# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTracesParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams,
                Anthropic::Internal::AnyHash
              )
            end

          # What the exported spans contain. Defaults to `metadata_only` on create.
          #
          # On update, `null` sets `metadata_only`.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::OrSymbol
              )
            )
          end
          attr_accessor :content_mode

          # Whether the destination receives traces. Defaults to true on create. It cannot
          # be null.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enabled

          sig { params(enabled: T::Boolean).void }
          attr_writer :enabled

          # The full URL of your collector's traces endpoint, for a collector that takes
          # traces on a path other than `/v1/traces`. The API posts traces to it exactly as
          # given and appends nothing.
          #
          # The same rules as for `endpoint_url` apply, except that any path is allowed. It
          # must have the same scheme, host, and port as `endpoint_url`. At most 2,048
          # characters.
          #
          # On create, `null` is the same as leaving it out. On update, `null` removes it.
          # The API then posts traces to `endpoint_url` with `/v1/traces` appended. A change
          # of this URL alone keeps the registered headers.
          sig { returns(T.nilable(String)) }
          attr_accessor :endpoint_url

          # The most bytes of content that one exported span can contain, from 1 up to the
          # API's maximum. `null` sets no bound, so only the API's maximum applies.
          #
          # On create, leaving it out is the same as `null`. The error for a value above the
          # maximum states the maximum.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :max_content_bytes

          # The settings for the traces that a telemetry destination receives, as a create
          # or update request sets them. An omitted field takes its default on create and
          # keeps its stored value on update.
          sig do
            params(
              content_mode:
                T.nilable(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::OrSymbol
                ),
              enabled: T::Boolean,
              endpoint_url: T.nilable(String),
              max_content_bytes: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # What the exported spans contain. Defaults to `metadata_only` on create.
            #
            # On update, `null` sets `metadata_only`.
            content_mode: nil,
            # Whether the destination receives traces. Defaults to true on create. It cannot
            # be null.
            enabled: nil,
            # The full URL of your collector's traces endpoint, for a collector that takes
            # traces on a path other than `/v1/traces`. The API posts traces to it exactly as
            # given and appends nothing.
            #
            # The same rules as for `endpoint_url` apply, except that any path is allowed. It
            # must have the same scheme, host, and port as `endpoint_url`. At most 2,048
            # characters.
            #
            # On create, `null` is the same as leaving it out. On update, `null` removes it.
            # The API then posts traces to `endpoint_url` with `/v1/traces` appended. A change
            # of this URL alone keeps the registered headers.
            endpoint_url: nil,
            # The most bytes of content that one exported span can contain, from 1 up to the
            # API's maximum. `null` sets no bound, so only the API's maximum applies.
            #
            # On create, leaving it out is the same as `null`. The error for a value above the
            # maximum states the maximum.
            max_content_bytes: nil
          )
          end

          sig do
            override.returns(
              {
                content_mode:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::OrSymbol
                  ),
                enabled: T::Boolean,
                endpoint_url: T.nilable(String),
                max_content_bytes: T.nilable(Integer)
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
