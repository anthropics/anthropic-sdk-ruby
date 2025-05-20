# typed: strong

module Anthropic
  module Models
    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam

    module Beta
      class BetaToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tool_use_id

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

        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaToolResultBlockParam::Content::Variants
            )
          )
        end
        attr_reader :content

        sig do
          params(
            content:
              Anthropic::Beta::BetaToolResultBlockParam::Content::Variants
          ).void
        end
        attr_writer :content

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_error

        sig { params(is_error: T::Boolean).void }
        attr_writer :is_error

        sig do
          params(
            tool_use_id: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            content:
              Anthropic::Beta::BetaToolResultBlockParam::Content::Variants,
            is_error: T::Boolean,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          tool_use_id:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          content: nil,
          is_error: nil,
          type: :tool_result
        )
        end

        sig do
          override.returns(
            {
              tool_use_id: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              content:
                Anthropic::Beta::BetaToolResultBlockParam::Content::Variants,
              is_error: T::Boolean
            }
          )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Variants
                ]
              )
            end

          module Content
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::BetaTextBlockParam,
                  Anthropic::Beta::BetaImageBlockParam
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolResultBlockParam::Content::Variants
              ]
            )
          end
          def self.variants
          end

          ContentArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                union:
                  Anthropic::Beta::BetaToolResultBlockParam::Content::Content
              ],
              Anthropic::Internal::Type::Converter
            )
        end
      end
    end
  end
end
