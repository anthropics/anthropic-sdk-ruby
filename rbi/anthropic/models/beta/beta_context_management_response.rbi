# typed: strong

module Anthropic
  module Models
    BetaContextManagementResponse = Beta::BetaContextManagementResponse

    module Beta
      class BetaContextManagementResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContextManagementResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # List of context management edits that were applied.
        sig do
          returns(
            T::Array[Anthropic::Beta::BetaClearToolUses20250919EditResponse]
          )
        end
        attr_accessor :applied_edits

        # Information about context management operations applied during the request.
        sig do
          params(
            applied_edits:
              T::Array[
                Anthropic::Beta::BetaClearToolUses20250919EditResponse::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # List of context management edits that were applied.
          applied_edits:
        )
        end

        sig do
          override.returns(
            {
              applied_edits:
                T::Array[Anthropic::Beta::BetaClearToolUses20250919EditResponse]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
