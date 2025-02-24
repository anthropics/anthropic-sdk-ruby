# typed: strong

module Anthropic
  module Models
    class ToolTextEditor20250124 < Anthropic::BaseModel
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
        params(_: T.nilable(Anthropic::Models::CacheControlEphemeral))
          .returns(T.nilable(Anthropic::Models::CacheControlEphemeral))
      end
      def cache_control=(_)
      end

      sig do
        params(cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral), name: Symbol, type: Symbol).void
      end
      def initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20250124)
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
