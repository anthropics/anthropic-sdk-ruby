# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # The customer-owned storage control, discriminated by `type`.
            module BetaGoogleManagedStorageControl
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISABLED =
                  T.let(
                    :disabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Type::TaggedSymbol
                  )
                ENABLED =
                  T.let(
                    :enabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type:
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Type::OrSymbol,
                  retired_buckets:
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket::OrHash
                    ],
                  buckets:
                    T::Hash[
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket::OrHash
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
                    ]
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Variants
                )
              end
              def self.new(
                type:,
                # Buckets that a region has retired, earliest `expires_at` first.
                retired_buckets:,
                # The bucket configured for each region, keyed by region code. A region with no
                # bucket is left out.
                buckets: nil,
                # Each region's status for the control, keyed by region code. A region that your
                # organization is not offered may have no entry, and Anthropic may add regions.
                status: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
