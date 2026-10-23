# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          class Bundles
            sig do
              returns(
                Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles::Targets
              )
            end
            attr_reader :targets

            # Get one Bundle. What the Bundle grants (connectors, repositories and
            # credentials) is never returned.
            sig do
              params(
                bundle_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle
              )
            end
            def retrieve(
              # The Bundle's identifier, starting with `capp_`.
              bundle_id,
              # This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # List the organization's Bundles, newest first by `created_at`. A Bundle that
            # Claude Tag manages for itself is not listed.
            sig do
              params(
                limit: Integer,
                page: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle
                ]
              )
            end
            def list(
              # Query param: Number of items to return per page, between 1 and 100. Defaults
              # to 20.
              limit: nil,
              # Query param: Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
