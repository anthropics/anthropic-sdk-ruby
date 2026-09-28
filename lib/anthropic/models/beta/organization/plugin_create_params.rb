# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Plugins#create
        class PluginCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute files
          #   The version's files: one part per file, the part's filename being the file's
          #   path within the Plugin (for example `skills/review-pr/SKILL.md`), or a single
          #   `.zip` or `.plugin` archive holding them all. On the wire each part is named
          #   `files[]`, and a part named plain `files` is not read; with cURL,
          #   `-F 'files[]=@SKILL.md;filename=skills/review-pr/SKILL.md'`. The files must
          #   include the manifest, `.claude-plugin/plugin.json`.
          #
          #   @return [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>]
          required :files, Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::FileInput]

          # @!attribute marketplace_id
          #   ID of the organization-owned plugin marketplace to create the Plugin in
          #   (prefixed `marketplace_`). It must be a `manual` marketplace, one whose Plugins
          #   are uploaded rather than synchronized from a repository. When omitted, the
          #   Plugin is created in the organization's library marketplace, an
          #   organization-owned `manual` marketplace created on first use.
          #
          #   @return [String, nil]
          optional :marketplace_id, String

          # @!attribute release_notes
          #   Release notes stored with the version and shown in its version history in
          #   claude.ai; up to 5,000 characters.
          #
          #   @return [String, nil]
          optional :release_notes, String

          # @!attribute betas
          #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(files:, marketplace_id: nil, release_notes: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::PluginCreateParams} for more details.
          #
          #   @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] The version's files: one part per file, the part's filename being the file's pat
          #
          #   @param marketplace_id [String] ID of the organization-owned plugin marketplace to create the Plugin in (prefixe
          #
          #   @param release_notes [String] Release notes stored with the version and shown in its version history in claude
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
