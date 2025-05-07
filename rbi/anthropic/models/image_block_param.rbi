# typed: strong

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig do
        returns(T.any(Anthropic::Base64ImageSource, Anthropic::URLImageSource))
      end
      attr_accessor :source

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      sig do
        params(
          source:
            T.any(
              Anthropic::Base64ImageSource::OrHash,
              Anthropic::URLImageSource::OrHash
            ),
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(source:, cache_control: nil, type: :image)
      end

      sig do
        override.returns(
          {
            source:
              T.any(Anthropic::Base64ImageSource, Anthropic::URLImageSource),
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral)
          }
        )
      end
      def to_hash
      end

      module Source
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Anthropic::Base64ImageSource, Anthropic::URLImageSource)
          end

        sig do
          override.returns(
            T::Array[Anthropic::ImageBlockParam::Source::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
