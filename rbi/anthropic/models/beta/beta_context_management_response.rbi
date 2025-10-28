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
            T::Array[
              Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
            ]
          )
        end
        attr_accessor :applied_edits

        sig do
          params(
            applied_edits:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919EditResponse::OrHash,
                  Anthropic::Beta::BetaClearThinking20251015EditResponse::OrHash
                )
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
                T::Array[
                  Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
                ]
            }
          )
        end
        def to_hash
        end

        module AppliedEdit
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaClearToolUses20250919EditResponse,
                Anthropic::Beta::BetaClearThinking20251015EditResponse
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaContextManagementResponse::AppliedEdit::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
