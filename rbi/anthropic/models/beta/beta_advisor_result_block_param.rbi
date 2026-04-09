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

        sig { params(text: String, type: Symbol).returns(T.attached_class) }
        def self.new(text:, type: :advisor_result)
        end

        sig { override.returns({ text: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
