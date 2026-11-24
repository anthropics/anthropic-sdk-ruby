# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # The customer-managed encryption key control, discriminated by `type`.
            module BetaGoogleManagedCMEKControl
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISABLED =
                  T.let(
                    :disabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Type::TaggedSymbol
                  )
                ENABLED =
                  T.let(
                    :enabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Variants
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
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Type::OrSymbol,
                  retired_keys:
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey::OrHash
                    ],
                  external_key_ids: T::Hash[Symbol, String],
                  status:
                    T::Hash[
                      Symbol,
                      T.any(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed::OrHash,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended::OrHash
                      )
                    ]
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Variants
                )
              end
              def self.new(
                type:,
                # Keys that a region has retired, earliest `expires_at` first.
                retired_keys:,
                # The ID of the External Key configured for each region (`ekey_...`), keyed by
                # region code. A region with no key is left out.
                external_key_ids: nil,
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
