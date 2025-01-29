# typed: strong

module Anthropic
  module Models
    BetaToolResultBlockParam = T.type_alias { Beta::BetaToolResultBlockParam }

    module Beta
      class BetaToolResultBlockParam < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            tool_use_id: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            content: Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Variants,
            is_error: T::Boolean
          }
        end

        sig { returns(String) }
        attr_accessor :tool_use_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Variants)) }
        attr_reader :content

        sig { params(content: Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Variants).void }
        attr_writer :content

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_error

        sig { params(is_error: T::Boolean).void }
        attr_writer :is_error

        sig do
          params(
            tool_use_id: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            content: Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Variants,
            is_error: T::Boolean,
            type: Symbol
          ).void
        end
        def initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result); end

        sig { returns(Anthropic::Models::Beta::BetaToolResultBlockParam::Shape) }
        def to_h; end

        class Content < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(
              String,
              T::Array[Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Content::Variants]
            )
          end

          ContentArray = T.type_alias do
            T::Array[Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Content::Variants]
          end

          class Content < Anthropic::Union
            abstract!

            Variants = T.type_alias do
              T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)
            end

            sig do
              returns(
                [
                  [Symbol, Anthropic::Models::Beta::BetaTextBlockParam],
                  [Symbol, Anthropic::Models::Beta::BetaImageBlockParam]
                ]
              )
            end
            private_class_method def self.variants; end
          end

          sig do
            returns(
              [
                [NilClass, String],
                [
                  NilClass,
                  T::Array[Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Content::Variants]
                ]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
