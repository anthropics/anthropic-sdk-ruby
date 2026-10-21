# typed: strong

module Anthropic
  module Models
    BetaUserMessageParam = Beta::BetaUserMessageParam

    module Beta
      class BetaUserMessageParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserMessageParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaMessageContentParam::Variants) }
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :role

        sig do
          params(
            content: Anthropic::Beta::BetaMessageContentParam::Variants,
            role: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, role: :user)
        end

        sig do
          override.returns(
            {
              content: Anthropic::Beta::BetaMessageContentParam::Variants,
              role: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
