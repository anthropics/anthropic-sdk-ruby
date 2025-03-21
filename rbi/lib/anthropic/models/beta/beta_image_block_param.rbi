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
        attr_accessor :source

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash))
          )
            .void
        end
        attr_writer :cache_control

        sig do
          params(
            source: T.any(
              Anthropic::Models::Beta::BetaBase64ImageSource,
              Anthropic::Util::AnyHash,
              Anthropic::Models::Beta::BetaURLImageSource
            ),
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)),
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

          class << self
            sig do
              override
                .returns([Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource])
            end
            def variants
            end
          end
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
