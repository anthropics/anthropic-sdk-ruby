# typed: strong

module Anthropic
  module Models
    BetaToolUseBlock = T.type_alias { Beta::BetaToolUseBlock }

    module Beta
      class BetaToolUseBlock < Anthropic::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig { returns(T.anything) }
        def input
        end

        sig { params(_: T.anything).returns(T.anything) }
        def input=(_)
        end

        sig { returns(String) }
        def name
        end

        sig { params(_: String).returns(String) }
        def name=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(id: String, input: T.anything, name: String, type: Symbol).returns(T.attached_class) }
        def self.new(id:, input:, name:, type: :tool_use)
        end

        sig { override.returns({id: String, input: T.anything, name: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
