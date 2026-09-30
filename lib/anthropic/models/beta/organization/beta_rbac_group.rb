# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACGroups#create
        class BetaRBACGroup < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the RBAC Group.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   RFC 3339 timestamp of when the RBAC Group was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute name
          #   Name of the RBAC Group. Not uniqueness-enforced.
          #
          #   @return [String]
          required :name, String

          # @!attribute role_ids
          #   RBAC Role IDs attached to this RBAC Group. Role attachment is managed in the
          #   admin settings and is read-only on this API. `null` means role data was
          #   temporarily unavailable — retry to distinguish from an empty list.
          #
          #   @return [Array<String>, nil]
          required :role_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute source_type
          #   How the RBAC Group was created: `"direct"` for groups created directly (for
          #   example, in the organization's admin settings), `"scim"` for groups provisioned
          #   by the identity provider.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaRBACGroup::SourceType]
          required :source_type, enum: -> { Anthropic::Beta::Organization::BetaRBACGroup::SourceType }

          # @!attribute type
          #   Object type.
          #
          #   For RBAC Groups, this is always `"rbac_group"`.
          #
          #   @return [Symbol, :rbac_group]
          required :type, const: :rbac_group

          # @!attribute updated_at
          #   RFC 3339 timestamp of when the RBAC Group was last updated.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!method initialize(id:, created_at:, name:, role_ids:, source_type:, updated_at:, type: :rbac_group)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaRBACGroup} for more details.
          #
          #   @param id [String] ID of the RBAC Group.
          #
          #   @param created_at [Time] RFC 3339 timestamp of when the RBAC Group was created.
          #
          #   @param name [String] Name of the RBAC Group. Not uniqueness-enforced.
          #
          #   @param role_ids [Array<String>, nil] RBAC Role IDs attached to this RBAC Group. Role attachment is managed in the adm
          #
          #   @param source_type [Symbol, Anthropic::Models::Beta::Organization::BetaRBACGroup::SourceType] How the RBAC Group was created: `"direct"` for groups created directly (for exam
          #
          #   @param updated_at [Time] RFC 3339 timestamp of when the RBAC Group was last updated.
          #
          #   @param type [Symbol, :rbac_group] Object type.

          # How the RBAC Group was created: `"direct"` for groups created directly (for
          # example, in the organization's admin settings), `"scim"` for groups provisioned
          # by the identity provider.
          #
          # @see Anthropic::Models::Beta::Organization::BetaRBACGroup#source_type
          module SourceType
            extend Anthropic::Internal::Type::Enum

            DIRECT = :direct
            SCIM = :scim

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
