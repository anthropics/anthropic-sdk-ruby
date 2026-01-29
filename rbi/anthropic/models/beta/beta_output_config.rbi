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

        # How much effort the model should put into its response. Higher effort levels may
        # result in more thorough analysis but take longer.
        #
        # Valid values are `low`, `medium`, or `high`.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaOutputConfig::Effort::OrSymbol)
          )
        end
        attr_accessor :effort

        # A schema to specify Claude's output format in responses. See
        # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
        sig { returns(T.nilable(Anthropic::Beta::BetaJSONOutputFormat)) }
        attr_reader :format_

        sig do
          params(
            format_: T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash)
          ).void
        end
        attr_writer :format_

        sig do
          params(
            effort:
              T.nilable(Anthropic::Beta::BetaOutputConfig::Effort::OrSymbol),
            format_: T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # How much effort the model should put into its response. Higher effort levels may
          # result in more thorough analysis but take longer.
          #
          # Valid values are `low`, `medium`, or `high`.
          effort: nil,
          # A schema to specify Claude's output format in responses. See
          # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
          format_: nil
        )
        end

        sig do
          override.returns(
            {
              effort:
                T.nilable(Anthropic::Beta::BetaOutputConfig::Effort::OrSymbol),
              format_: T.nilable(Anthropic::Beta::BetaJSONOutputFormat)
            }
          )
        end
        def to_hash
        end

        # How much effort the model should put into its response. Higher effort levels may
        # result in more thorough analysis but take longer.
        #
        # Valid values are `low`, `medium`, or `high`.
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
