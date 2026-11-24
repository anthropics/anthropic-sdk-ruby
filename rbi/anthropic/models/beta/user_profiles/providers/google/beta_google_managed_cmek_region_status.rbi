# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # One region's status for the `cmek` control, discriminated by `type`.
            module BetaGoogleManagedCMEKRegionStatus
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                NOT_CONFIGURED =
                  T.let(
                    :not_configured,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::TaggedSymbol
                  )
                PENDING =
                  T.let(
                    :pending,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::TaggedSymbol
                  )
                ACTIVE =
                  T.let(
                    :active,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::TaggedSymbol
                  )
                FAILED =
                  T.let(
                    :failed,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Variants
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
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type::OrSymbol,
                  effective_external_key_id: T.nilable(String),
                  error: T.any(T.nilable(String), String),
                  last_checked_at: T.nilable(Time),
                  validated_at: Time
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Variants
                )
              end
              def self.new(
                type:,
                # The ID of the External Key that the region applies now (`ekey_...`). While a
                # replacement key is `pending` or `failed`, this is the previous key. `null` when
                # the region applies no key.
                effective_external_key_id:,
                # Why the latest validation attempt failed. `null` when no attempt has failed.
                error: nil,
                # When the region last got a successful answer from Google Cloud KMS for the key,
                # in RFC 3339 format. `null` when it has none to report.
                last_checked_at: nil,
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
