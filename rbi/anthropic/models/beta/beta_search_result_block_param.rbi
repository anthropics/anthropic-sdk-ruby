# typed: strong

module Anthropic
  module Models
    BetaSearchResultBlockParam = Beta::BetaSearchResultBlockParam

    module Beta
      class BetaSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSearchResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Anthropic::Beta::BetaTextBlockParam]) }
        attr_accessor :content

        sig { returns(String) }
        attr_accessor :source

        sig { returns(String) }
        attr_accessor :title

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        sig { returns(T.nilable(Anthropic::Beta::BetaCitationsConfigParam)) }
        attr_reader :citations

        sig do
          params(
            citations: Anthropic::Beta::BetaCitationsConfigParam::OrHash
          ).void
        end
        attr_writer :citations

        sig do
          params(
            content: T::Array[Anthropic::Beta::BetaTextBlockParam::OrHash],
            source: String,
            title: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            citations: Anthropic::Beta::BetaCitationsConfigParam::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          source:,
          title:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          citations: nil,
          type: :search_result
        )
        end

        sig do
          override.returns(
            {
              content: T::Array[Anthropic::Beta::BetaTextBlockParam],
              source: String,
              title: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              citations: Anthropic::Beta::BetaCitationsConfigParam
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
