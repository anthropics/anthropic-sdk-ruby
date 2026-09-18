# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitBatchGroup < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Opaque identifier of the rate-limit group (for example,
          #   `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
          #   changes, unlike the entry's own identifier, which differs per organization.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Always `batch`: the Message Batches API.
          #
          #   @return [Symbol, :batch]
          required :type, const: :batch

          # @!method initialize(id:, type: :batch)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup} for
          #   more details.
          #
          #   @param id [String] Opaque identifier of the rate-limit group (for example, `rlg_01VPTCmyiu5ZLsWkcxY
          #
          #   @param type [Symbol, :batch] Always `batch`: the Message Batches API.
        end
      end
    end
  end
end
