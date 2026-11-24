# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKEnabled < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The ID of the External Key configured for each region (`ekey_...`), keyed by
                # region code. A region with no key is left out.
                sig { returns(T::Hash[Symbol, String]) }
                attr_accessor :external_key_ids

                # Keys that a region has retired, earliest `expires_at` first.
                sig do
                  returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey
                    ]
                  )
                end
                attr_accessor :retired_keys

                # Each region's status for the control, keyed by region code. A region that your
                # organization is not offered may have no entry, and Anthropic may add regions.
                sig do
                  returns(
                    T::Hash[
                      Symbol,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Variants
                    ]
                  )
                end
                attr_accessor :status

                sig { returns(Symbol) }
                attr_accessor :type

                # The control is on and has a key for at least one region.
                sig do
                  params(
                    external_key_ids: T::Hash[Symbol, String],
                    retired_keys:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey::OrHash
                      ],
                    status:
                      T::Hash[
                        Symbol,
                        T.any(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionNotConfigured::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionActive::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionSuspended::OrHash
                        )
                      ],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The ID of the External Key configured for each region (`ekey_...`), keyed by
                  # region code. A region with no key is left out.
                  external_key_ids:,
                  # Keys that a region has retired, earliest `expires_at` first.
                  retired_keys:,
                  # Each region's status for the control, keyed by region code. A region that your
                  # organization is not offered may have no entry, and Anthropic may add regions.
                  status:,
                  type: :enabled
                )
                end

                sig do
                  override.returns(
                    {
                      external_key_ids: T::Hash[Symbol, String],
                      retired_keys:
                        T::Array[
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey
                        ],
                      status:
                        T::Hash[
                          Symbol,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Variants
                        ],
                      type: Symbol
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
