# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class TargetListParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::TargetListParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The Bundle's identifier, starting with `capp_`.
              sig { returns(String) }
              attr_accessor :bundle_id

              # Number of items to return per page, between 1 and 100. Defaults to 20.
              sig { returns(T.nilable(Integer)) }
              attr_reader :limit

              sig { params(limit: Integer).void }
              attr_writer :limit

              # Opaque cursor from a previous response's `next_page`.
              sig { returns(T.nilable(String)) }
              attr_reader :page

              sig { params(page: String).void }
              attr_writer :page

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
                  bundle_id: String,
                  limit: Integer,
                  page: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # The Bundle's identifier, starting with `capp_`.
                bundle_id:,
                # Number of items to return per page, between 1 and 100. Defaults to 20.
                limit: nil,
                # Opaque cursor from a previous response's `next_page`.
                page: nil,
                # This endpoint is in beta: requests must send
                # `experimental-claude-tag-2026-10-21` in this header.
                betas: nil,
                request_options: {}
              )
              end

              sig do
                override.returns(
                  {
                    bundle_id: String,
                    limit: Integer,
                    page: String,
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
