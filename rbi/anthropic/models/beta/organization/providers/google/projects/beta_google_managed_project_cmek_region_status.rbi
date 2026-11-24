# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              module BetaGoogleManagedProjectCMEKRegionStatus
                extend Anthropic::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionNotConfigured,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionActive,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionSuspended
                    )
                  end

                module Type
                  extend Anthropic::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NOT_CONFIGURED =
                    T.let(
                      :not_configured,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::TaggedSymbol
                    )
                  PENDING =
                    T.let(
                      :pending,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::TaggedSymbol
                    )
                  ACTIVE =
                    T.let(
                      :active,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::TaggedSymbol
                    )
                  FAILED =
                    T.let(
                      :failed,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::TaggedSymbol
                    )
                  SUSPENDED =
                    T.let(
                      :suspended,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Variants
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
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Type::OrSymbol,
                    effective_external_key_id: T.nilable(String),
                    error: T.any(T.nilable(String), String),
                    last_checked_at: T.nilable(Time),
                    validated_at: Time
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus::Variants
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
end
