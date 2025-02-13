# typed: strong

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::BaseModel
      sig { returns(Anthropic::Models::ImageBlockParam::Source) }
      def source
      end

      sig do
        params(_: Anthropic::Models::ImageBlockParam::Source).returns(Anthropic::Models::ImageBlockParam::Source)
      end
      def source=(_)
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
        params(_: T.nilable(Anthropic::Models::CacheControlEphemeral)).returns(T.nilable(Anthropic::Models::CacheControlEphemeral))
      end
      def cache_control=(_)
      end

      sig do
        params(
          source: Anthropic::Models::ImageBlockParam::Source,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          type: Symbol
        ).void
      end
      def initialize(source:, cache_control: nil, type: :image)
      end

      sig do
        override.returns(
          {
            source: Anthropic::Models::ImageBlockParam::Source,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral)
          }
        )
      end
      def to_hash
      end

      class Source < Anthropic::BaseModel
        sig { returns(String) }
        def data
        end

        sig { params(_: String).returns(String) }
        def data=(_)
        end

        sig { returns(Symbol) }
        def media_type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def media_type=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(data: String, media_type: Symbol, type: Symbol).void }
        def initialize(data:, media_type:, type: :base64)
        end

        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
        def to_hash
        end

        class MediaType < Anthropic::Enum
          abstract!

          IMAGE_JPEG = :"image/jpeg"
          IMAGE_PNG = :"image/png"
          IMAGE_GIF = :"image/gif"
          IMAGE_WEBP = :"image/webp"

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
