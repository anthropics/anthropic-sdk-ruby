# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Sessions#update
      class SessionUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute session_id
        #
        #   @return [String]
        required :session_id, String

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omit the field to preserve.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute title
        #   Human-readable session title.
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!attribute vault_ids
        #   Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests
        #   setting this field are rejected. Reserved for future use.
        #
        #   @return [Array<String>, nil]
        optional :vault_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(session_id:, metadata: nil, title: nil, vault_ids: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SessionUpdateParams} for more details.
        #
        #   @param session_id [String]
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param title [String, nil] Human-readable session title.
        #
        #   @param vault_ids [Array<String>] Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests settin
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
