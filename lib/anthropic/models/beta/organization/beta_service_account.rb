# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ServiceAccounts#create
        class BetaServiceAccount < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Tagged ID of the service account.
          #
          #   @return [String]
          required :id, String

          # @!attribute archived_at
          #   If set, this service account is archived.
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute archived_by_actor_id
          #   Tagged ID (`user_`/`svac_`) of the actor that archived this service account.
          #
          #   @return [String, nil]
          required :archived_by_actor_id, String, nil?: true

          # @!attribute created_at
          #   When this service account was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute created_by_actor_id
          #   Tagged ID (`user_`/`svac_`) of the actor that created this service account.
          #
          #   @return [String, nil]
          required :created_by_actor_id, String, nil?: true

          # @!attribute description
          #   Optional free-text description.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute name
          #   Admin-chosen slug identifier.
          #
          #   @return [String]
          required :name, String

          # @!attribute organization_role
          #   Org-level role. A federation rule may only be created or retargeted to grant
          #   `org:admin` scope when this is `admin`. A rule granting `org:admin` whose target
          #   is later demoted to `developer` is rejected at token exchange. Rules granting
          #   `org:admin` are managed in the Console.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaServiceAccount::OrganizationRole]
          required :organization_role,
                   enum: -> { Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole }

          # @!attribute type
          #
          #   @return [Symbol, :service_account]
          required :type, const: :service_account

          # @!attribute updated_at
          #   When this service account was last updated.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute updated_by_actor_id
          #   Tagged ID (`user_`/`svac_`) of the actor that last updated this service account.
          #
          #   @return [String, nil]
          required :updated_by_actor_id, String, nil?: true

          # @!method initialize(id:, archived_at:, archived_by_actor_id:, created_at:, created_by_actor_id:, description:, name:, organization_role:, updated_at:, updated_by_actor_id:, type: :service_account)
          #   Named non-human identity within the caller's organization.
          #
          #   A service account is a pure identity: name + org. Authorization lives on
          #   whatever references it (federation rules).
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaServiceAccount} for more details.
          #
          #   @param id [String] Tagged ID of the service account.
          #
          #   @param archived_at [Time, nil] If set, this service account is archived.
          #
          #   @param archived_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that archived this service account.
          #
          #   @param created_at [Time] When this service account was created.
          #
          #   @param created_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that created this service account.
          #
          #   @param description [String, nil] Optional free-text description.
          #
          #   @param name [String] Admin-chosen slug identifier.
          #
          #   @param organization_role [Symbol, Anthropic::Models::Beta::Organization::BetaServiceAccount::OrganizationRole] Org-level role. A federation rule may only be created or retargeted to grant `or
          #
          #   @param updated_at [Time] When this service account was last updated.
          #
          #   @param updated_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that last updated this service account.
          #
          #   @param type [Symbol, :service_account]

          # Org-level role. A federation rule may only be created or retargeted to grant
          # `org:admin` scope when this is `admin`. A rule granting `org:admin` whose target
          # is later demoted to `developer` is rejected at token exchange. Rules granting
          # `org:admin` are managed in the Console.
          #
          # @see Anthropic::Models::Beta::Organization::BetaServiceAccount#organization_role
          module OrganizationRole
            extend Anthropic::Internal::Type::Enum

            ADMIN = :admin
            DEVELOPER = :developer

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
