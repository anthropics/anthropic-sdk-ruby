# typed: strong

module Anthropic
  module Models
    BetaImageBlockParam = T.type_alias { Beta::BetaImageBlockParam }

    module Beta
      class BetaImageBlockParam < Anthropic::BaseModel
        sig { returns(Anthropic::Models::Beta::BetaImageBlockParam::Source) }
        attr_accessor :source

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig do
          params(
            source: Anthropic::Models::Beta::BetaImageBlockParam::Source,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            type: Symbol
          ).void
        end
        def initialize(source:, cache_control: nil, type: :image); end

        sig do
          override.returns(
            {
              source: Anthropic::Models::Beta::BetaImageBlockParam::Source,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash; end

        class Source < Anthropic::BaseModel
          sig { returns(String) }
          attr_accessor :data

          sig { returns(Symbol) }
          attr_accessor :media_type

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(data: String, media_type: Symbol, type: Symbol).void }
          def initialize(data:, media_type:, type: :base64); end

          sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
          def to_hash; end

          class MediaType < Anthropic::Enum
            abstract!

            IMAGE_JPEG = :"image/jpeg"
            IMAGE_PNG = :"image/png"
            IMAGE_GIF = :"image/gif"
            IMAGE_WEBP = :"image/webp"

            sig { override.returns(T::Array[Symbol]) }
            def self.values; end
          end
        end
      end
    end
  end
end
