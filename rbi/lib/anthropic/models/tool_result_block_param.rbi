# typed: strong

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      def tool_use_id
      end

      sig { params(_: String).returns(String) }
      def tool_use_id=(_)
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
        returns(
          T.nilable(
            T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
          )
        )
      end
      def content
      end

      sig do
        params(
          _: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
        )
          .returns(
            T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
          )
      end
      def content=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def is_error
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def is_error=(_)
      end

      sig do
        params(
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          content: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]),
          is_error: T::Boolean,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
      end

      sig do
        override
          .returns(
            {
              tool_use_id: String,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
              content: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]),
              is_error: T::Boolean
            }
          )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
            }
          end

        ContentArray =
          T.let(
            Anthropic::ArrayOf[union: Anthropic::Models::ToolResultBlockParam::Content::Content],
            Anthropic::Converter
          )

        module Content
          extend Anthropic::Union

          Variants =
            type_template(:out) { {fixed: T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)} }

          class << self
            sig { override.returns([Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam]) }
            def variants
            end
          end
        end

        class << self
          sig do
            override
              .returns([String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]])
          end
          def variants
          end
        end
      end
    end
  end
end
