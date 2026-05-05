# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsTextRubricParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Rubric content. Plain text or markdown — the grader treats it as freeform text.
          # Maximum 262144 characters.
          sig { returns(String) }
          attr_accessor :content

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Rubric content provided inline as text.
          sig do
            params(
              content: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Rubric content. Plain text or markdown — the grader treats it as freeform text.
            # Maximum 262144 characters.
            content:,
            type:
          )
          end

          sig do
            override.returns(
              {
                content: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type::TaggedSymbol
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
end
