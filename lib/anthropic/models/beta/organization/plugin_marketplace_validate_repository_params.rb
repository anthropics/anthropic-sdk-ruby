# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::PluginMarketplaces#validate_repository
        class PluginMarketplaceValidateRepositoryParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute repository_url
          #   The `https://` URL of a public repository on github.com that holds the
          #   marketplace. Any other host, a URL with credentials in it, or one that does not
          #   name a repository is a 400.
          #
          #   @return [String]
          required :repository_url, String

          # @!attribute ref
          #   The branch to validate the tip of, or the full 40-character SHA of the commit to
          #   validate. When omitted, the branch a synchronization would read (usually the
          #   repository's default branch); if that is not the default branch, the report's
          #   `ref` says which branch was read. An empty string, or a value that is neither a
          #   branch name nor a 40-character SHA, is a 400.
          #
          #   @return [String, nil]
          optional :ref, String, nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(repository_url:, ref: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::PluginMarketplaceValidateRepositoryParams}
          #   for more details.
          #
          #   @param repository_url [String] The `https://` URL of a public repository on github.com that holds the marketpla
          #
          #   @param ref [String, nil] The branch to validate the tip of, or the full 40-character SHA of the commit to
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
