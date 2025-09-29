# typed: strong

module Anthropic
  module Models
    BetaContextManagementConfig = Beta::BetaContextManagementConfig

    module Beta
      class BetaContextManagementConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContextManagementConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # List of context management edits to apply
        sig do
          returns(
            T.nilable(T::Array[Anthropic::Beta::BetaClearToolUses20250919Edit])
          )
        end
        attr_reader :edits

        sig do
          params(
            edits:
              T::Array[Anthropic::Beta::BetaClearToolUses20250919Edit::OrHash]
          ).void
        end
        attr_writer :edits

        # Configuration for context management operations.
        sig do
          params(
            edits:
              T::Array[Anthropic::Beta::BetaClearToolUses20250919Edit::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # List of context management edits to apply
          edits: nil
        )
        end

        sig do
          override.returns(
            { edits: T::Array[Anthropic::Beta::BetaClearToolUses20250919Edit] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
