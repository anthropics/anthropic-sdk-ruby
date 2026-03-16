# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigAdaptive = Beta::BetaThinkingConfigAdaptive

    module Beta
      class BetaThinkingConfigAdaptive < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingConfigAdaptive,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Controls how thinking content appears in the response. When set to `summarized`,
        # thinking is returned normally. When set to `omitted`, thinking content is
        # redacted but a signature is returned for multi-turn continuity. Defaults to
        # `summarized`.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaThinkingConfigAdaptive::Display::OrSymbol
            )
          )
        end
        attr_accessor :display_

        sig do
          params(
            display_:
              T.nilable(
                Anthropic::Beta::BetaThinkingConfigAdaptive::Display::OrSymbol
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Controls how thinking content appears in the response. When set to `summarized`,
          # thinking is returned normally. When set to `omitted`, thinking content is
          # redacted but a signature is returned for multi-turn continuity. Defaults to
          # `summarized`.
          display_: nil,
          type: :adaptive
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              display_:
                T.nilable(
                  Anthropic::Beta::BetaThinkingConfigAdaptive::Display::OrSymbol
                )
            }
          )
        end
        def to_hash
        end

        # Controls how thinking content appears in the response. When set to `summarized`,
        # thinking is returned normally. When set to `omitted`, thinking content is
        # redacted but a signature is returned for multi-turn continuity. Defaults to
        # `summarized`.
        module Display
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaThinkingConfigAdaptive::Display
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUMMARIZED =
            T.let(
              :summarized,
              Anthropic::Beta::BetaThinkingConfigAdaptive::Display::TaggedSymbol
            )
          OMITTED =
            T.let(
              :omitted,
              Anthropic::Beta::BetaThinkingConfigAdaptive::Display::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaThinkingConfigAdaptive::Display::TaggedSymbol
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
