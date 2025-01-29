# typed: strong

module Anthropic
  module Models
    class ToolUseBlockParam < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          id: String,
          input: T.anything,
          name: String,
          type: Symbol,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral)
        }
      end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.anything) }
      attr_accessor :input

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig do
        params(
          id: String,
          input: T.anything,
          name: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          type: Symbol
        ).void
      end
      def initialize(id:, input:, name:, cache_control: nil, type: :tool_use); end

      sig { returns(Anthropic::Models::ToolUseBlockParam::Shape) }
      def to_h; end
    end
  end
end
