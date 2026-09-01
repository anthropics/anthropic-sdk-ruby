# typed: strong

module Anthropic
  module Models
    BetaSystemMessageOutputConfig = Beta::BetaSystemMessageOutputConfig

    module Beta
      class BetaSystemMessageOutputConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSystemMessageOutputConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # All possible effort levels.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::OrSymbol
            )
          )
        end
        attr_accessor :effort

        # Per-message output configuration on a role:"system" input message.
        #
        # Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
        # accepted on a message that carries content; a message with neither content nor
        # output_config fields is rejected.
        sig do
          params(
            effort:
              T.nilable(
                Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::OrSymbol
              )
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
                T.nilable(
                  Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::OrSymbol
                )
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
              T.all(
                Symbol,
                Anthropic::Beta::BetaSystemMessageOutputConfig::Effort
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::TaggedSymbol
            )
          XHIGH =
            T.let(
              :xhigh,
              Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::TaggedSymbol
            )
          MAX =
            T.let(
              :max,
              Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaSystemMessageOutputConfig::Effort::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
