# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceTool < Anthropic::BaseModel
        # The name of the tool to use.
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

        # The model will use the specified tool with `tool_choice.name`.
        sig do
          params(name: String, disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class)
        end
        def self.new(name:, disable_parallel_tool_use: nil, type: :tool)
        end

        sig { override.returns({name: String, type: Symbol, disable_parallel_tool_use: T::Boolean}) }
        def to_hash
        end
      end
    end

    BetaToolChoiceTool = Beta::BetaToolChoiceTool
  end
end
