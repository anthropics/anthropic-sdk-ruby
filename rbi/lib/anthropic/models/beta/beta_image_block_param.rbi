# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::BaseModel
        sig do
          returns(
            T.any(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource)
          )
        end
        def source
        end

        sig do
          params(
            _: T.any(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource)
          )
            .returns(
              T.any(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource)
            )
        end
        def source=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)))
            .returns(T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)))
        end
        def cache_control=(_)
        end

        sig do
          params(
            source: T.any(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource),
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
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
                source: T.any(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource),
                type: Symbol,
                cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)
              }
            )
        end
        def to_hash
        end

        module Source
          extend Anthropic::Union

          Variants =
            type_template(:out) do
              {fixed: T.any(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource)}
            end
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
