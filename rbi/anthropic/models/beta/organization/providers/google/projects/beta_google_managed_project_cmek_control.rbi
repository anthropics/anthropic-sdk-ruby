# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-managed encryption key control: the key in your Google Cloud KMS
              # that is set for each region. It covers the project's requests that name no user
              # profile, or a user profile that has no key of its own for the project.
              module BetaGoogleManagedProjectCMEKControl
                extend Anthropic::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled
                    )
                  end

                module Type
                  extend Anthropic::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Type
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  DISABLED =
                    T.let(
                      :disabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Type::TaggedSymbol
                    )
                  ENABLED =
                    T.let(
                      :enabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Type::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Type::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Variants
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
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Type::OrSymbol,
                    retired_keys:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey::OrHash
                      ],
                    external_key_ids: T::Hash[Symbol, String],
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
                      ]
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Variants
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
end
