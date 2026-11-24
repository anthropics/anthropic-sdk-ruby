# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # @see Anthropic::Resources::Beta::Organization::Providers::Google::Projects::DataControls#retrieve
              class BetaGoogleManagedProjectDataControls < Anthropic::Internal::Type::BaseModel
                # @!attribute cmek
                #   The customer-managed encryption key control: the key in your Google Cloud KMS
                #   that is set for each region. It covers the project's requests that name no user
                #   profile, or a user profile that has no key of its own for the project.
                #
                #   @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled]
                required :cmek,
                         union: -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl }

                # @!attribute project_number
                #   The number of the Google Cloud project that these controls belong to, in
                #   decimal.
                #
                #   @return [String]
                required :project_number, String

                # @!attribute storage
                #   The customer-owned storage control: your Cloud Storage bucket that is set for
                #   each region. It covers the project's requests that name no user profile, or a
                #   user profile that has no bucket of its own for the project.
                #
                #   @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled]
                required :storage,
                         union: -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl }

                # @!attribute type
                #   Object type. Always `google_managed_project_data_controls`.
                #
                #   @return [Symbol, :google_managed_project_data_controls]
                required :type, const: :google_managed_project_data_controls

                # @!attribute updated_at
                #   When an update last changed a control, or a region's status last changed, in RFC
                #   3339 format. A region that starts or stops reading `suspended`, a change to
                #   `last_checked_at` alone, and the removal of a retired entry do not count.
                #
                #   @return [Time]
                required :updated_at, Time

                # @!method initialize(cmek:, project_number:, storage:, updated_at:, type: :google_managed_project_data_controls)
                #   A Google Cloud project's encryption key and storage bucket settings for Claude
                #   on Google Cloud's Agent Platform. Your organization has one of these objects for
                #   each Google Cloud project that it has proved it owns. You can read and update
                #   it, but not create or delete it. Keys and buckets are set for each region. A
                #   request's region depends on the Google endpoint it is sent to: `us` is the US
                #   multi-region endpoint and the regional endpoint of every location whose name
                #   starts with `us-`, `eu` is the EU multi-region endpoint and the regional
                #   endpoint of every location whose name starts with `europe-`, `sg` is the
                #   `asia-southeast1` regional endpoint, and `global` is the global endpoint,
                #   wherever Google serves the request. Anthropic may add regions.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls}
                #   for more details.
                #
                #   @param cmek [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled] The customer-managed encryption key control: the key in your Google Cloud KMS th
                #
                #   @param project_number [String] The number of the Google Cloud project that these controls belong to, in decimal
                #
                #   @param storage [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled] The customer-owned storage control: your Cloud Storage bucket that is set for ea
                #
                #   @param updated_at [Time] When an update last changed a control, or a region's status last changed, in RFC
                #
                #   @param type [Symbol, :google_managed_project_data_controls] Object type. Always `google_managed_project_data_controls`.
              end
            end
          end
        end
      end
    end
  end
end
