# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # How to set the `storage` control, discriminated by `type`.
            module BetaGoogleManagedStorageControlParams
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISABLED =
                  T.let(
                    :disabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Type::TaggedSymbol
                  )
                ENABLED =
                  T.let(
                    :enabled,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Variants
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
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Type::OrSymbol,
                  buckets:
                    T::Hash[
                      Symbol,
                      T.nilable(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference::OrHash
                      )
                    ]
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Variants
                )
              end
              def self.new(
                type:,
                # The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
                # object with `project_number` and `bucket_name` sets that region's bucket, `null`
                # removes it, and a region you leave out keeps its bucket. A bucket can serve only
                # one region. While the control is on, at least one region must have a bucket.
                buckets: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
