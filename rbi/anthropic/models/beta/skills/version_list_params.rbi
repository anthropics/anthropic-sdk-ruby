# typed: strong

module Anthropic
  module Models
    module Beta
      module Skills
        class VersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Skills::VersionListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :limit

          # Optionally set to the `next_page` token from the previous response.
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
              betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              limit: T.nilable(Integer),
              page: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # Optionally set to the `next_page` token from the previous response.
            page: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: T.nilable(Integer),
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
