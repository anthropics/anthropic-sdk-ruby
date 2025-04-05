# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceTool < Anthropic::Internal::Type::BaseModel
        # The name of the tool to use.
        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # Whether to disable parallel tool use.
        #
        #   Defaults to `false`. If set to `true`, the model will output exactly one tool
        #   use.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :disable_parallel_tool_use

        sig { params(disable_parallel_tool_use: T::Boolean).void }
        attr_writer :disable_parallel_tool_use

        # The model will use the specified tool with `tool_choice.name`.
        sig do
          params(name: String, disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class)
        end
        def self.new(name:, disable_parallel_tool_use: nil, type: :tool); end

        sig { override.returns({name: String, type: Symbol, disable_parallel_tool_use: T::Boolean}) }
        def to_hash; end
      end
    end

    BetaToolChoiceTool = Beta::BetaToolChoiceTool
  end
end
