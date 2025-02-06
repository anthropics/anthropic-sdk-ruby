# typed: strong

module Anthropic
  module Models
    BetaToolUseBlock = T.type_alias { Beta::BetaToolUseBlock }

    module Beta
      class BetaToolUseBlock < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.anything) }
        attr_accessor :input

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, input: T.anything, name: String, type: Symbol).void }
        def initialize(id:, input:, name:, type: :tool_use); end

        sig { override.returns({id: String, input: T.anything, name: String, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
