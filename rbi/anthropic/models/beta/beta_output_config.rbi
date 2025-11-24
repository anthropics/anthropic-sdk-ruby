# typed: strong

module Anthropic
  module Models
    BetaOutputConfig = Beta::BetaOutputConfig

    module Beta
      class BetaOutputConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOutputConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # All possible effort levels.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaOutputConfig::Effort::OrSymbol)
          )
        end
        attr_accessor :effort

        sig do
          params(
            effort:
              T.nilable(Anthropic::Beta::BetaOutputConfig::Effort::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          # All possible effort levels.
          effort: nil
        )
        end

        sig do
          override.returns(
            {
              effort:
                T.nilable(Anthropic::Beta::BetaOutputConfig::Effort::OrSymbol)
            }
          )
        end
        def to_hash
        end

        # All possible effort levels.
        module Effort
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaOutputConfig::Effort)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(:low, Anthropic::Beta::BetaOutputConfig::Effort::TaggedSymbol)
          MEDIUM =
            T.let(
              :medium,
              Anthropic::Beta::BetaOutputConfig::Effort::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              Anthropic::Beta::BetaOutputConfig::Effort::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaOutputConfig::Effort::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
