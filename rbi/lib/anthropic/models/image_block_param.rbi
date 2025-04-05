# typed: strong

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
      sig { returns(T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource)) }
      attr_accessor :source

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
        params(
          source: T.any(
            Anthropic::Models::Base64ImageSource,
            Anthropic::Internal::AnyHash,
            Anthropic::Models::URLImageSource
          ),
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Internal::AnyHash)),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(source:, cache_control: nil, type: :image); end

      sig do
        override
          .returns(
            {
              source: T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource),
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral)
            }
          )
      end
      def to_hash; end

      module Source
        extend Anthropic::Internal::Type::Union

        sig { override.returns([Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]) }
        def self.variants; end
      end
    end
  end
end
