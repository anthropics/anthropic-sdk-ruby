# typed: strong

module Anthropic
  module Models
    class ToolBash20250124 < Anthropic::BaseModel
      # Name of the tool.
      #
      #   This is how the tool will be called by the model and in tool_use blocks.
      sig { returns(Symbol) }
      def name
      end

      sig { params(_: Symbol).returns(Symbol) }
      def name=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      def cache_control
      end

      sig do
        params(_: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
          .returns(T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
      end
      def cache_control=(_)
      end

      sig do
        params(cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral), name: Symbol, type: Symbol)
          .returns(T.attached_class)
      end
      def self.new(cache_control: nil, name: :bash, type: :bash_20250124)
      end

      sig do
        override
          .returns({name: Symbol, type: Symbol, cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral)})
      end
      def to_hash
      end
    end
  end
end
