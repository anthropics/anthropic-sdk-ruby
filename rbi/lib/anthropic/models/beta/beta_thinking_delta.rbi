# typed: strong

module Anthropic
  module Models
    BetaThinkingDelta = T.type_alias { Beta::BetaThinkingDelta }

    module Beta
      class BetaThinkingDelta < Anthropic::BaseModel
        sig { returns(String) }
        def thinking
        end

        sig { params(_: String).returns(String) }
        def thinking=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(thinking: String, type: Symbol).returns(T.attached_class) }
        def self.new(thinking:, type: :thinking_delta)
        end

        sig { override.returns({thinking: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
