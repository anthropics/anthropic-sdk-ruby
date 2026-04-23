# typed: strong

module Anthropic
  module Models
    BetaCompactionContentBlockDelta = Beta::BetaCompactionContentBlockDelta

    module Beta
      class BetaCompactionContentBlockDelta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompactionContentBlockDelta,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :content

        # Opaque metadata from prior compaction, to be round-tripped verbatim
        sig { returns(T.nilable(String)) }
        attr_accessor :encrypted_content

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content: T.nilable(String),
            encrypted_content: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          # Opaque metadata from prior compaction, to be round-tripped verbatim
          encrypted_content:,
          type: :compaction_delta
        )
        end

        sig do
          override.returns(
            {
              content: T.nilable(String),
              encrypted_content: T.nilable(String),
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
