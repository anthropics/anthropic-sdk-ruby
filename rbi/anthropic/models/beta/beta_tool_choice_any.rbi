# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceAny < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        # Whether to disable parallel tool use.
        #
        # Defaults to `false`. If set to `true`, the model will output exactly one tool
        # use.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :disable_parallel_tool_use

        sig { params(disable_parallel_tool_use: T::Boolean).void }
        attr_writer :disable_parallel_tool_use

        # The model will use any available tools.
        sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Whether to disable parallel tool use.
          #
          # Defaults to `false`. If set to `true`, the model will output exactly one tool
          # use.
          disable_parallel_tool_use: nil,
          type: :any
        ); end
        sig { override.returns({type: Symbol, disable_parallel_tool_use: T::Boolean}) }
        def to_hash; end
      end
    end

    BetaToolChoiceAny = Beta::BetaToolChoiceAny
  end
end
