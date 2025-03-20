# typed: strong

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::BaseModel
      sig { returns(T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource)) }
      def source
      end

      sig do
        params(_: T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource))
          .returns(T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource))
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
        params(_: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
          .returns(T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
      end
      def cache_control=(_)
      end

      sig do
        params(
          source: T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource),
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(source:, cache_control: nil, type: :image)
      end

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
      def to_hash
      end

      module Source
        extend Anthropic::Union

        Variants =
          type_template(:out) { {fixed: T.any(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource)} }

        class << self
          sig { override.returns([Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]) }
          def variants
          end
        end
      end
    end
  end
end
