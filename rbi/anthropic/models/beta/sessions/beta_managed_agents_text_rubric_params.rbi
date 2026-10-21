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

          sig { returns(Symbol) }
          attr_accessor :type

          # Rubric content provided inline as text.
          sig do
            params(content: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Rubric content. Plain text or markdown — the grader treats it as freeform text.
            # Maximum 262144 characters.
            content:,
            type: :text
          )
          end

          sig { override.returns({ content: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
