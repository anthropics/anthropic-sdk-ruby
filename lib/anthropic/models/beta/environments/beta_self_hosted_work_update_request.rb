# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkUpdateRequest < Anthropic::Internal::Type::BaseModel
          # @!attribute metadata
          #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          #   Omit the field to preserve existing metadata.
          #
          #   @return [Hash{Symbol=>String, nil}]
          required :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true]

          # @!method initialize(metadata:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Environments::BetaSelfHostedWorkUpdateRequest} for
          #   more details.
          #
          #   Request to update work item metadata.
          #
          #   @param metadata [Hash{Symbol=>String, nil}] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        end
      end
    end
  end
end
