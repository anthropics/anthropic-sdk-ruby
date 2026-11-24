# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              module BetaGoogleManagedProjectStorageRegionStatus
                extend Anthropic::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended
                    )
                  end

                module Type
                  extend Anthropic::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NOT_CONFIGURED =
                    T.let(
                      :not_configured,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::TaggedSymbol
                    )
                  PENDING =
                    T.let(
                      :pending,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::TaggedSymbol
                    )
                  ACTIVE =
                    T.let(
                      :active,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::TaggedSymbol
                    )
                  FAILED =
                    T.let(
                      :failed,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::TaggedSymbol
                    )
                  SUSPENDED =
                    T.let(
                      :suspended,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Variants
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
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type::OrSymbol,
                    effective_bucket:
                      T.nilable(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket::OrHash
                      ),
                    failed_checks:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::OrHash
                      ],
                    validated_at: Time
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Variants
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
end
