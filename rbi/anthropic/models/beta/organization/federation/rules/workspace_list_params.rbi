# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          module Rules
            class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::Federation::Rules::WorkspaceListParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              # ID of the federation rule.
              sig { returns(String) }
              attr_accessor :federation_rule_id

              # Number of results per page.
              sig { returns(T.nilable(Integer)) }
              attr_reader :limit

              sig { params(limit: Integer).void }
              attr_writer :limit

              # Opaque cursor from a previous response's `next_page`.
              sig { returns(T.nilable(String)) }
              attr_accessor :page

              # Optional header to specify the beta version(s) you want to use.
              sig do
                returns(
                  T.nilable(
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
                  )
                )
              end
              attr_reader :betas

              sig do
                params(
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
                ).void
              end
              attr_writer :betas

              sig do
                params(
                  federation_rule_id: String,
                  limit: Integer,
                  page: T.nilable(String),
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # ID of the federation rule.
                federation_rule_id:,
                # Number of results per page.
                limit: nil,
                # Opaque cursor from a previous response's `next_page`.
                page: nil,
                # Optional header to specify the beta version(s) you want to use.
                betas: nil,
                request_options: {}
              )
              end

              sig do
                override.returns(
                  {
                    federation_rule_id: String,
                    limit: Integer,
                    page: T.nilable(String),
                    betas:
                      T::Array[
                        T.any(String, Anthropic::AnthropicBeta::OrSymbol)
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
