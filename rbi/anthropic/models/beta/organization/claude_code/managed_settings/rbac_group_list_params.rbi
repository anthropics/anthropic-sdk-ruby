# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class RBACGroupListParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupListParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `100`.
              sig { returns(T.nilable(Integer)) }
              attr_reader :limit

              sig { params(limit: Integer).void }
              attr_writer :limit

              # Optionally set to the `next_page` token from the previous response.
              sig { returns(T.nilable(String)) }
              attr_accessor :page

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
                  limit: Integer,
                  page: T.nilable(String),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Number of items to return per page.
                #
                # Defaults to `20`. Ranges from `1` to `100`.
                limit: nil,
                # Optionally set to the `next_page` token from the previous response.
                page: nil,
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
              )
              end

              sig do
                override.returns(
                  {
                    limit: Integer,
                    page: T.nilable(String),
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
