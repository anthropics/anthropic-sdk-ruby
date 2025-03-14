# typed: strong

module Anthropic
  module Models
    BetaToolChoiceAny = T.type_alias { Beta::BetaToolChoiceAny }

    module Beta
      class BetaToolChoiceAny < Anthropic::BaseModel
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        # Whether to disable parallel tool use.
        #
        #   Defaults to `false`. If set to `true`, the model will output exactly one tool
        #   use.
        sig { returns(T.nilable(T::Boolean)) }
        def disable_parallel_tool_use
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def disable_parallel_tool_use=(_)
        end

        # The model will use any available tools.
        sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class) }
        def self.new(disable_parallel_tool_use: nil, type: :any)
        end

        sig { override.returns({type: Symbol, disable_parallel_tool_use: T::Boolean}) }
        def to_hash
        end
      end
    end
  end
end
