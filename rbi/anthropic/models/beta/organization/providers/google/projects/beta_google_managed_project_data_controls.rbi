# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectDataControls < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The customer-managed encryption key control: the key in your Google Cloud KMS
                # that is set for each region. It covers the project's requests that name no user
                # profile, or a user profile that has no key of its own for the project.
                sig do
                  returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Variants
                  )
                end
                attr_accessor :cmek

                # The number of the Google Cloud project that these controls belong to, in
                # decimal.
                sig { returns(String) }
                attr_accessor :project_number

                # The customer-owned storage control: your Cloud Storage bucket that is set for
                # each region. It covers the project's requests that name no user profile, or a
                # user profile that has no bucket of its own for the project.
                sig do
                  returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Variants
                  )
                end
                attr_accessor :storage

                # Object type. Always `google_managed_project_data_controls`.
                sig { returns(Symbol) }
                attr_accessor :type

                # When an update last changed a control, or a region's status last changed, in RFC
                # 3339 format. A region that starts or stops reading `suspended`, a change to
                # `last_checked_at` alone, and the removal of a retired entry do not count.
                sig { returns(Time) }
                attr_accessor :updated_at

                # A Google Cloud project's encryption key and storage bucket settings for Claude
                # on Google Cloud's Agent Platform. Your organization has one of these objects for
                # each Google Cloud project that it has proved it owns. You can read and update
                # it, but not create or delete it. Keys and buckets are set for each region. A
                # request's region depends on the Google endpoint it is sent to: `us` is the US
                # multi-region endpoint and the regional endpoint of every location whose name
                # starts with `us-`, `eu` is the EU multi-region endpoint and the regional
                # endpoint of every location whose name starts with `europe-`, `sg` is the
                # `asia-southeast1` regional endpoint, and `global` is the global endpoint,
                # wherever Google serves the request. Anthropic may add regions.
                sig do
                  params(
                    cmek:
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled::OrHash,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled::OrHash
                      ),
                    project_number: String,
                    storage:
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled::OrHash,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled::OrHash
                      ),
                    updated_at: Time,
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The customer-managed encryption key control: the key in your Google Cloud KMS
                  # that is set for each region. It covers the project's requests that name no user
                  # profile, or a user profile that has no key of its own for the project.
                  cmek:,
                  # The number of the Google Cloud project that these controls belong to, in
                  # decimal.
                  project_number:,
                  # The customer-owned storage control: your Cloud Storage bucket that is set for
                  # each region. It covers the project's requests that name no user profile, or a
                  # user profile that has no bucket of its own for the project.
                  storage:,
                  # When an update last changed a control, or a region's status last changed, in RFC
                  # 3339 format. A region that starts or stops reading `suspended`, a change to
                  # `last_checked_at` alone, and the removal of a retired entry do not count.
                  updated_at:,
                  # Object type. Always `google_managed_project_data_controls`.
                  type: :google_managed_project_data_controls
                )
                end

                sig do
                  override.returns(
                    {
                      cmek:
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Variants,
                      project_number: String,
                      storage:
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Variants,
                      type: Symbol,
                      updated_at: Time
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end
        end
      end
    end
  end
end
