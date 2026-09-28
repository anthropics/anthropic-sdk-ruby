# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::PluginMarketplaces#validate_archive
        class PluginMarketplaceValidateArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute archive
          #   A .zip of the marketplace directory (its contents at the root, or wrapped in one
          #   folder as a Git host's download produces), sent as a file part with a filename;
          #   DEFLATE- or STORE-compressed, at most 32 MB. A part sent without a filename, a
          #   second archive part, or any other form field is a 400; a larger archive is
          #   a 413.
          #
          #   @return [Pathname, StringIO, IO, String, Anthropic::FilePart]
          required :archive, Anthropic::Internal::Type::FileInput

          # @!attribute betas
          #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(archive:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::PluginMarketplaceValidateArchiveParams}
          #   for more details.
          #
          #   @param archive [Pathname, StringIO, IO, String, Anthropic::FilePart] A .zip of the marketplace directory (its contents at the root, or wrapped in one
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
