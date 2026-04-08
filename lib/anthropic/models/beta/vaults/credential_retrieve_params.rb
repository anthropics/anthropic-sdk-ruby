# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#retrieve
        class CredentialRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute vault_id
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute credential_id
          #
          #   @return [String]
          required :credential_id, String

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(vault_id:, credential_id:, betas: nil, request_options: {})
          #   @param vault_id [String]
          #
          #   @param credential_id [String]
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
