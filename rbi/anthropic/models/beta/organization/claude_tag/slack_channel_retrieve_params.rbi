# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class SlackChannelRetrieveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::SlackChannelRetrieveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The channel's identifier, starting with `slch_`.
            sig { returns(String) }
            attr_accessor :id

            # When `true`, `settings` holds what applies in the channel once the settings
            # levels above it are taken into account, and every member of `sources` names the
            # level a value comes from. When `false` or left out, `settings` holds what the
            # channel itself stores.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_inherited

            sig { params(include_inherited: T::Boolean).void }
            attr_writer :include_inherited

            # This endpoint is in beta: requests must send
            # `experimental-claude-tag-2026-10-21` in this header.
            sig do
              returns(
                T.nilable(
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
                )
              )
            end
            attr_reader :betas

            sig do
              params(
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                id: String,
                include_inherited: T::Boolean,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The channel's identifier, starting with `slch_`.
              id:,
              # When `true`, `settings` holds what applies in the channel once the settings
              # levels above it are taken into account, and every member of `sources` names the
              # level a value comes from. When `false` or left out, `settings` holds what the
              # channel itself stores.
              include_inherited: nil,
              # This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  include_inherited: T::Boolean,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
