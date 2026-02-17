# typed: strong

module Anthropic
  module Models
    BetaWebFetchToolResultBlockParam = Beta::BetaWebFetchToolResultBlockParam

    module Beta
      class BetaWebFetchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchToolResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaWebFetchToolResultErrorBlockParam,
              Anthropic::Beta::BetaWebFetchBlockParam
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

        # Tool invocation directly from the model.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaDirectCaller,
                Anthropic::Beta::BetaServerToolCaller,
                Anthropic::Beta::BetaServerToolCaller20260120
              )
            )
          )
        end
        attr_reader :caller_

        sig do
          params(
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              )
          ).void
        end
        attr_writer :caller_

        sig do
          params(
            content:
              T.any(
                Anthropic::Beta::BetaWebFetchToolResultErrorBlockParam::OrHash,
                Anthropic::Beta::BetaWebFetchBlockParam::OrHash
              ),
            tool_use_id: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          tool_use_id:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Tool invocation directly from the model.
          caller_: nil,
          type: :web_fetch_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  Anthropic::Beta::BetaWebFetchToolResultErrorBlockParam,
                  Anthropic::Beta::BetaWebFetchBlockParam
                ),
              tool_use_id: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              caller_:
                T.any(
                  Anthropic::Beta::BetaDirectCaller,
                  Anthropic::Beta::BetaServerToolCaller,
                  Anthropic::Beta::BetaServerToolCaller20260120
                )
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
                Anthropic::Beta::BetaWebFetchToolResultErrorBlockParam,
                Anthropic::Beta::BetaWebFetchBlockParam
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchToolResultBlockParam::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Tool invocation directly from the model.
        module Caller
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaDirectCaller,
                Anthropic::Beta::BetaServerToolCaller,
                Anthropic::Beta::BetaServerToolCaller20260120
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchToolResultBlockParam::Caller::Variants
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
