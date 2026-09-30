# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Federation
        # @see Anthropic::Resources::Organization::Federation::Issuers#archive
        class IssuerArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute federation_issuer_id
          #   ID of the federation issuer to archive.
          #
          #   @return [String]
          required :federation_issuer_id, String

          # @!method initialize(federation_issuer_id:, request_options: {})
          #   @param federation_issuer_id [String] ID of the federation issuer to archive.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
