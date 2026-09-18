# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitFilesGroup < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Opaque identifier of the rate-limit group (for example,
          #   `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
          #   changes, unlike the entry's own identifier, which differs per organization.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Always `files`: the Files API.
          #
          #   @return [Symbol, :files]
          required :type, const: :files

          # @!method initialize(id:, type: :files)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup} for
          #   more details.
          #
          #   @param id [String] Opaque identifier of the rate-limit group (for example, `rlg_01VPTCmyiu5ZLsWkcxY
          #
          #   @param type [Symbol, :files] Always `files`: the Files API.
        end
      end
    end
  end
end
