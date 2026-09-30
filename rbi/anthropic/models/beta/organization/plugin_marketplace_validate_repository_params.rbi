# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class PluginMarketplaceValidateRepositoryParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::PluginMarketplaceValidateRepositoryParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The `https://` URL of a public repository on github.com that holds the
          # marketplace. Any other host, a URL with credentials in it, or one that does not
          # name a repository is a 400.
          sig { returns(String) }
          attr_accessor :repository_url

          # The branch to validate the tip of, or the full 40-character SHA of the commit to
          # validate. When omitted, the branch a synchronization would read (usually the
          # repository's default branch); if that is not the default branch, the report's
          # `ref` says which branch was read. An empty string, or a value that is neither a
          # branch name nor a 40-character SHA, is a 400.
          sig { returns(T.nilable(String)) }
          attr_accessor :ref

          # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          # header.
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
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              repository_url: String,
              ref: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The `https://` URL of a public repository on github.com that holds the
            # marketplace. Any other host, a URL with credentials in it, or one that does not
            # name a repository is a 400.
            repository_url:,
            # The branch to validate the tip of, or the full 40-character SHA of the commit to
            # validate. When omitted, the branch a synchronization would read (usually the
            # repository's default branch); if that is not the default branch, the report's
            # `ref` says which branch was read. An empty string, or a value that is neither a
            # branch name nor a 40-character SHA, is a 400.
            ref: nil,
            # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                repository_url: String,
                ref: T.nilable(String),
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
