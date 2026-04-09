# typed: strong

module Anthropic
  module Models
    BetaAdvisorToolResultBlockParam = Beta::BetaAdvisorToolResultBlockParam

    module Beta
      class BetaAdvisorToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorToolResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaAdvisorToolResultErrorParam,
              Anthropic::Beta::BetaAdvisorResultBlockParam,
              Anthropic::Beta::BetaAdvisorRedactedResultBlockParam
            )
          )
        end
        attr_accessor :content

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
          params(
            content:
              T.any(
                Anthropic::Beta::BetaAdvisorToolResultErrorParam::OrHash,
                Anthropic::Beta::BetaAdvisorResultBlockParam::OrHash,
                Anthropic::Beta::BetaAdvisorRedactedResultBlockParam::OrHash
              ),
            tool_use_id: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          tool_use_id:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :advisor_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  Anthropic::Beta::BetaAdvisorToolResultErrorParam,
                  Anthropic::Beta::BetaAdvisorResultBlockParam,
                  Anthropic::Beta::BetaAdvisorRedactedResultBlockParam
                ),
              tool_use_id: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
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
                Anthropic::Beta::BetaAdvisorToolResultErrorParam,
                Anthropic::Beta::BetaAdvisorResultBlockParam,
                Anthropic::Beta::BetaAdvisorRedactedResultBlockParam
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaAdvisorToolResultBlockParam::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
