# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # One region's status for the `storage` control, discriminated by `type`.
            module BetaGoogleManagedStorageRegionStatus
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                NOT_CONFIGURED =
                  T.let(
                    :not_configured,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::TaggedSymbol
                  )
                PENDING =
                  T.let(
                    :pending,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::TaggedSymbol
                  )
                ACTIVE =
                  T.let(
                    :active,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::TaggedSymbol
                  )
                FAILED =
                  T.let(
                    :failed,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Variants
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
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type::OrSymbol,
                  effective_bucket:
                    T.nilable(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference::OrHash
                    ),
                  failed_checks:
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::OrHash
                    ],
                  validated_at: Time
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Variants
                )
              end
              def self.new(
                type:,
                # The bucket that the region applies now. While a replacement bucket is `pending`
                # or `failed`, this is the previous bucket. `null` when the region applies no
                # bucket.
                effective_bucket:,
                # The checks that the latest reported verification attempt failed. Empty when none
                # has failed.
                failed_checks: nil,
                # When the status last became `active`, in RFC 3339 format.
                validated_at: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
