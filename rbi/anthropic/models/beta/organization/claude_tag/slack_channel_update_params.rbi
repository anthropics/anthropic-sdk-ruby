# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class SlackChannelUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::SlackChannelUpdateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The channel's identifier, starting with `slch_`.
            sig { returns(String) }
            attr_accessor :id

            # The settings to change.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate
              )
            end
            attr_reader :settings

            sig do
              params(
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate::OrHash
              ).void
            end
            attr_writer :settings

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
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate::OrHash,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The channel's identifier, starting with `slch_`.
              id:,
              # The settings to change.
              settings:,
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
                  settings:
                    Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate,
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
