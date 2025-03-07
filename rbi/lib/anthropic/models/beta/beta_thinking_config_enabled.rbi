# typed: strong

module Anthropic
  module Models
    BetaThinkingConfigEnabled = T.type_alias { Beta::BetaThinkingConfigEnabled }

    module Beta
      class BetaThinkingConfigEnabled < Anthropic::BaseModel
        sig { returns(Integer) }
        def budget_tokens
        end

        sig { params(_: Integer).returns(Integer) }
        def budget_tokens=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(budget_tokens: Integer, type: Symbol).returns(T.attached_class) }
        def self.new(budget_tokens:, type: :enabled)
        end

        sig { override.returns({budget_tokens: Integer, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
