# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageEnabledParams < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams,
                      Anthropic::Internal::AnyHash
                    )
                  end

                sig { returns(Symbol) }
                attr_accessor :type

                # The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
                # object with `project_number` and `bucket_name` sets that region's bucket, `null`
                # removes it, and a region you leave out keeps its bucket. A bucket can serve only
                # one region. While the control is on, at least one region must have a bucket.
                sig do
                  returns(
                    T.nilable(
                      T::Hash[
                        Symbol,
                        T.nilable(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectBucketReference
                        )
                      ]
                    )
                  )
                end
                attr_reader :buckets

                sig do
                  params(
                    buckets:
                      T::Hash[
                        Symbol,
                        T.nilable(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectBucketReference::OrHash
                        )
                      ]
                  ).void
                end
                attr_writer :buckets

                # Turns the control on, or changes its buckets while it is on.
                sig do
                  params(
                    buckets:
                      T::Hash[
                        Symbol,
                        T.nilable(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectBucketReference::OrHash
                        )
                      ],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
                  # object with `project_number` and `bucket_name` sets that region's bucket, `null`
                  # removes it, and a region you leave out keeps its bucket. A bucket can serve only
                  # one region. While the control is on, at least one region must have a bucket.
                  buckets: nil,
                  type: :enabled
                )
                end

                sig do
                  override.returns(
                    {
                      type: Symbol,
                      buckets:
                        T::Hash[
                          Symbol,
                          T.nilable(
                            Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectBucketReference
                          )
                        ]
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end
        end
      end
    end
  end
end
