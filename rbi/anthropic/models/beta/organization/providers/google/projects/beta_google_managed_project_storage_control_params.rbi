# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-owned storage control. Leave it out to keep the control as it is.
              # Send `cmek`, `storage`, or both.
              module BetaGoogleManagedProjectStorageControlParams
                extend Anthropic::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams
                    )
                  end

                module Type
                  extend Anthropic::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Type
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  DISABLED =
                    T.let(
                      :disabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Type::TaggedSymbol
                    )
                  ENABLED =
                    T.let(
                      :enabled,
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Type::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Type::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Variants
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
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Type::OrSymbol,
                    buckets:
                      T::Hash[
                        Symbol,
                        T.nilable(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectBucketReference::OrHash
                        )
                      ]
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Variants
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
end
