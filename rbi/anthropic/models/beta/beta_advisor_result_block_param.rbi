# typed: strong

module Anthropic
  module Models
    BetaAdvisorResultBlockParam = Beta::BetaAdvisorResultBlockParam

    module Beta
      class BetaAdvisorResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :stop_reason

        sig do
          params(
            text: String,
            stop_reason: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(text:, stop_reason: nil, type: :advisor_result)
        end

        sig do
          override.returns(
            { text: String, type: Symbol, stop_reason: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
