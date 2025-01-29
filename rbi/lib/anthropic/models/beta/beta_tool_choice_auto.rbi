# typed: strong

module Anthropic
  module Models
    BetaToolChoiceAuto = T.type_alias { Beta::BetaToolChoiceAuto }

    module Beta
      class BetaToolChoiceAuto < Anthropic::BaseModel
        Shape = T.type_alias { {type: Symbol, disable_parallel_tool_use: T::Boolean} }

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :disable_parallel_tool_use

        sig { params(disable_parallel_tool_use: T::Boolean).void }
        attr_writer :disable_parallel_tool_use

        sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).void }
        def initialize(disable_parallel_tool_use: nil, type: :auto); end

        sig { returns(Anthropic::Models::Beta::BetaToolChoiceAuto::Shape) }
        def to_h; end
      end
    end
  end
end
