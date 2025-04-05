# typed: strong

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Internal::AnyHash))
        )
          .void
      end
      attr_writer :cache_control

      sig do
        returns(
          T.nilable(
            T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
          )
        )
      end
      attr_reader :content

      sig do
        params(
          content: T.any(
            String,
            T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Internal::AnyHash, Anthropic::Models::ImageBlockParam)]
          )
        )
          .void
      end
      attr_writer :content

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_error

      sig { params(is_error: T::Boolean).void }
      attr_writer :is_error

      sig do
        params(
          tool_use_id: String,
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Internal::AnyHash)),
          content: T.any(
            String,
            T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Internal::AnyHash, Anthropic::Models::ImageBlockParam)]
          ),
          is_error: T::Boolean,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result); end

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
      def to_hash; end

      module Content
        extend Anthropic::Internal::Type::Union

        module Content
          extend Anthropic::Internal::Type::Union

          sig { override.returns([Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam]) }
          def self.variants; end
        end

        sig do
          override
            .returns([String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]])
        end
        def self.variants; end

        ContentArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::ToolResultBlockParam::Content::Content],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
