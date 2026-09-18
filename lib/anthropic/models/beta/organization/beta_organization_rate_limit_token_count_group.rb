# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitTokenCountGroup < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Opaque identifier of the rate-limit group (for example,
          #   `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
          #   changes, unlike the entry's own identifier, which differs per organization.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Always `token_count`: the Token Count API.
          #
          #   @return [Symbol, :token_count]
          required :type, const: :token_count

          # @!method initialize(id:, type: :token_count)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup}
          #   for more details.
          #
          #   @param id [String] Opaque identifier of the rate-limit group (for example, `rlg_01VPTCmyiu5ZLsWkcxY
          #
          #   @param type [Symbol, :token_count] Always `token_count`: the Token Count API.
        end
      end
    end
  end
end
