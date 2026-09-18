# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitModelGroup < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Opaque identifier of the rate-limit group (for example,
          #   `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
          #   changes, unlike the entry's own identifier, which differs per organization.
          #
          #   @return [String]
          required :id, String

          # @!attribute display_name
          #   Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For
          #   display only; it may change.
          #
          #   @return [String]
          required :display_name, String

          # @!attribute type
          #   Always `model_group`: a family of models.
          #
          #   @return [Symbol, :model_group]
          required :type, const: :model_group

          # @!method initialize(id:, display_name:, type: :model_group)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup} for
          #   more details.
          #
          #   @param id [String] Opaque identifier of the rate-limit group (for example, `rlg_01VPTCmyiu5ZLsWkcxY
          #
          #   @param display_name [String] Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For d
          #
          #   @param type [Symbol, :model_group] Always `model_group`: a family of models.
        end
      end
    end
  end
end
