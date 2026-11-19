# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class RBACGroupDefaultUpdateParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultUpdateParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The whole settings document, a JSON object of Claude Code managed settings. It
              # replaces any stored document, or `null` clears the default settings. At most 1
              # MiB as the server stores it, which can be larger than the request body.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :settings

              # This endpoint is in beta: requests must send
              # `ce-claude-code-managed-settings-2026-10-06` in this header.
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
                  settings: T.nilable(T::Hash[Symbol, T.anything]),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # The whole settings document, a JSON object of Claude Code managed settings. It
                # replaces any stored document, or `null` clears the default settings. At most 1
                # MiB as the server stores it, which can be larger than the request body.
                settings:,
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
              )
              end

              sig do
                override.returns(
                  {
                    settings: T.nilable(T::Hash[Symbol, T.anything]),
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ],
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
end
