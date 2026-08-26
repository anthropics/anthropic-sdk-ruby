# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class IssuerListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::IssuerListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Include archived resources. Defaults to false.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_archived

            sig { params(include_archived: T::Boolean).void }
            attr_writer :include_archived

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
                include_archived: T::Boolean,
                limit: Integer,
                page: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Include archived resources. Defaults to false.
              include_archived: nil,
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
                  include_archived: T::Boolean,
                  limit: Integer,
                  page: T.nilable(String),
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
