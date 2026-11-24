# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageEnabled < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The bucket configured for each region, keyed by region code. A region with no
              # bucket is left out.
              sig do
                returns(
                  T::Hash[
                    Symbol,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket
                  ]
                )
              end
              attr_accessor :buckets

              # Buckets that a region has retired, earliest `expires_at` first.
              sig do
                returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket
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
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Variants
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
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket::OrHash
                    ],
                  retired_buckets:
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket::OrHash
                    ],
                  status:
                    T::Hash[
                      Symbol,
                      T.any(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended::OrHash
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
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket
                      ],
                    retired_buckets:
                      T::Array[
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket
                      ],
                    status:
                      T::Hash[
                        Symbol,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Variants
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
