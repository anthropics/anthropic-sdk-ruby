# typed: strong

module Anthropic
  module Models
    BetaFallbackRefusalTrigger = Beta::BetaFallbackRefusalTrigger

    module Beta
      class BetaFallbackRefusalTrigger < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackRefusalTrigger,
              Anthropic::Internal::AnyHash
            )
          end

        # The policy category that triggered a refusal.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
            )
          )
        end
        attr_accessor :category

        sig { returns(Symbol) }
        attr_accessor :type

        # The `from` model declined for policy reasons.
        sig do
          params(
            category:
              T.nilable(
                Anthropic::Beta::BetaFallbackRefusalTrigger::Category::OrSymbol
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The policy category that triggered a refusal.
          category:,
          type: :refusal
        )
        end

        sig do
          override.returns(
            {
              category:
                T.nilable(
                  Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
                ),
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # The policy category that triggered a refusal.
        module Category
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaFallbackRefusalTrigger::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CYBER =
            T.let(
              :cyber,
              Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
            )
          BIO =
            T.let(
              :bio,
              Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
            )
          FRONTIER_LLM =
            T.let(
              :frontier_llm,
              Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
            )
          REASONING_EXTRACTION =
            T.let(
              :reasoning_extraction,
              Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaFallbackRefusalTrigger::Category::TaggedSymbol
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
