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
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919Edit,
                  Anthropic::Beta::BetaClearThinking20251015Edit
                )
              ]
            )
          )
        end
        attr_reader :edits

        sig do
          params(
            edits:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919Edit::OrHash,
                  Anthropic::Beta::BetaClearThinking20251015Edit::OrHash
                )
              ]
          ).void
        end
        attr_writer :edits

        sig do
          params(
            edits:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaClearToolUses20250919Edit::OrHash,
                  Anthropic::Beta::BetaClearThinking20251015Edit::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # List of context management edits to apply
          edits: nil
        )
        end

        sig do
          override.returns(
            {
              edits:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaClearToolUses20250919Edit,
                    Anthropic::Beta::BetaClearThinking20251015Edit
                  )
                ]
            }
          )
        end
        def to_hash
        end

        module Edit
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaClearToolUses20250919Edit,
                Anthropic::Beta::BetaClearThinking20251015Edit
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaContextManagementConfig::Edit::Variants
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
