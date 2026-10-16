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
          #   marketplace. A URL longer than 2,048 characters, on any other host or scheme,
          #   with a port other than 443 or 80, with credentials in it, or that does not name
          #   exactly `owner/repo` (a trailing `.git` or `/` is accepted) is a 400. A private
          #   or missing repository is reported in the response, not refused.
          #
          #   @return [String]
          required :repository_url, String

          # @!attribute ref
          #   The branch to validate the tip of, or the full 40-character SHA of the commit to
          #   validate. When omitted, the branch a synchronization would read (usually the
          #   repository's default branch); if that is not the default branch, the report's
          #   `ref` says which branch was read. An empty string, a value longer than 255
          #   characters, or one that contains `..` or a character other than ASCII letters,
          #   digits, `.`, `_`, `-`, `+`, and `/`, is a 400. Any other value that is not a
          #   40-character SHA is read as a branch name; if the repository has no such branch,
          #   the response is a report with `valid: false`, not a 400.
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
