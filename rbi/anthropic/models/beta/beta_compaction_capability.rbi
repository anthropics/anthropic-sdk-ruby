# typed: strong

module Anthropic
  module Models
    BetaCompactionCapability = Beta::BetaCompactionCapability

    module Beta
      class BetaCompactionCapability < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompactionCapability,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the summarize compaction type is supported.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :summarize

        sig do
          params(summarize: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :summarize

        # Whether this capability is supported by the model.
        sig { returns(T::Boolean) }
        attr_accessor :supported

        # Compaction capability details: whether the model accepts the top-level
        # `compaction` request parameter, with one entry per supported `compaction.type`
        # value.
        sig do
          params(
            summarize: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            supported: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the summarize compaction type is supported.
          summarize:,
          # Whether this capability is supported by the model.
          supported:
        )
        end

        sig do
          override.returns(
            {
              summarize: Anthropic::Beta::BetaCapabilitySupport,
              supported: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
