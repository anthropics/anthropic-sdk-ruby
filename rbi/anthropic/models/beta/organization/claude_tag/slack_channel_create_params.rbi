# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class SlackChannelCreateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::SlackChannelCreateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Slack's own identifiers for the channel to set up. The organization must own the
            # workspace.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers
              )
            end
            attr_reader :slack

            sig do
              params(
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash
              ).void
            end
            attr_writer :slack

            # Settings to store on the channel, applied as Update Slack Channel applies them.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsCreate
                )
              )
            end
            attr_reader :settings

            sig do
              params(
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsCreate::OrHash
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
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash,
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsCreate::OrHash,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Slack's own identifiers for the channel to set up. The organization must own the
              # workspace.
              slack:,
              # Settings to store on the channel, applied as Update Slack Channel applies them.
              settings: nil,
              # This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  slack:
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
                  settings:
                    Anthropic::Beta::Organization::BetaClaudeTagSettingsCreate,
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
