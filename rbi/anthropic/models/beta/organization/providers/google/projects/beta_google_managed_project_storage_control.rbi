# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-owned storage control: your Cloud Storage bucket that is set for
              # each region. It covers the project's requests that name no user profile, or a
              # user profile that has no bucket of its own for the project.
              module BetaGoogleManagedProjectStorageControl
                extend Anthropic::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled
                    )
                  end

                module Type
                  extend Anthropic::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Type
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  DISABLED =
                    T.let(
                      :disabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Type::TaggedSymbol
                    )
                  ENABLED =
                    T.let(
                      :enabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Type::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Type::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Variants
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
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Type::OrSymbol,
                    retired_buckets:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket::OrHash
                      ],
                    buckets:
                      T::Hash[
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket::OrHash
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
                      ]
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Variants
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
end
