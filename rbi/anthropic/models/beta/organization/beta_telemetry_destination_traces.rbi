# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTraces < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationTraces,
                Anthropic::Internal::AnyHash
              )
            end

          # What the exported spans contain.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::TaggedSymbol
            )
          end
          attr_accessor :content_mode

          # Whether the destination receives traces. A destination whose `enabled` is false
          # keeps its other settings.
          sig { returns(T::Boolean) }
          attr_accessor :enabled

          # The full URL that the API posts traces to, exactly as registered, or `null` if
          # the destination doesn't have one.
          #
          # When it is `null`, the API posts traces to `endpoint_url` with `/v1/traces`
          # appended.
          sig { returns(T.nilable(String)) }
          attr_accessor :endpoint_url

          # The most bytes of content that one exported span can contain, or `null` if only
          # the API's maximum applies.
          #
          # Content means model prompts and responses, and tool inputs and outputs. The API
          # shortens longer content to this size before it delivers the span. A destination
          # whose `content_mode` is `metadata_only` keeps this value. It applies once
          # `content_mode` is `content`.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :max_content_bytes

          # A telemetry destination's settings for the traces it receives.
          sig do
            params(
              content_mode:
                Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::OrSymbol,
              enabled: T::Boolean,
              endpoint_url: T.nilable(String),
              max_content_bytes: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # What the exported spans contain.
            content_mode:,
            # Whether the destination receives traces. A destination whose `enabled` is false
            # keeps its other settings.
            enabled:,
            # The full URL that the API posts traces to, exactly as registered, or `null` if
            # the destination doesn't have one.
            #
            # When it is `null`, the API posts traces to `endpoint_url` with `/v1/traces`
            # appended.
            endpoint_url:,
            # The most bytes of content that one exported span can contain, or `null` if only
            # the API's maximum applies.
            #
            # Content means model prompts and responses, and tool inputs and outputs. The API
            # shortens longer content to this size before it delivers the span. A destination
            # whose `content_mode` is `metadata_only` keeps this value. It applies once
            # `content_mode` is `content`.
            max_content_bytes:
          )
          end

          sig do
            override.returns(
              {
                content_mode:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationContentMode::TaggedSymbol,
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
