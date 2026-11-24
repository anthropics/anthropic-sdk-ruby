# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageEnabled < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The bucket configured for each region, keyed by region code. A region with no
                # bucket is left out.
                sig do
                  returns(
                    T::Hash[
                      Symbol,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket
                    ]
                  )
                end
                attr_accessor :buckets

                # Buckets that a region has retired, earliest `expires_at` first.
                sig do
                  returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket
                    ]
                  )
                end
                attr_accessor :retired_buckets

                # Each region's status for the control, keyed by region code. A region that your
                # organization is not offered may have no entry, and Anthropic may add regions.
                sig do
                  returns(
                    T::Hash[
                      Symbol,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Variants
                    ]
                  )
                end
                attr_accessor :status

                sig { returns(Symbol) }
                attr_accessor :type

                # The control is on and has a bucket for at least one region.
                sig do
                  params(
                    buckets:
                      T::Hash[
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket::OrHash
                      ],
                    retired_buckets:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket::OrHash
                      ],
                    status:
                      T::Hash[
                        Symbol,
                        T.any(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed::OrHash,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended::OrHash
                        )
                      ],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The bucket configured for each region, keyed by region code. A region with no
                  # bucket is left out.
                  buckets:,
                  # Buckets that a region has retired, earliest `expires_at` first.
                  retired_buckets:,
                  # Each region's status for the control, keyed by region code. A region that your
                  # organization is not offered may have no entry, and Anthropic may add regions.
                  status:,
                  type: :enabled
                )
                end

                sig do
                  override.returns(
                    {
                      buckets:
                        T::Hash[
                          Symbol,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket
                        ],
                      retired_buckets:
                        T::Array[
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket
                        ],
                      status:
                        T::Hash[
                          Symbol,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Variants
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
