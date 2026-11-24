# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageRegionFailed < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The bucket that the region applies now. While a replacement bucket is `pending`
                # or `failed`, this is the previous bucket. `null` when the region applies no
                # bucket.
                sig do
                  returns(
                    T.nilable(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket
                    )
                  )
                end
                attr_reader :effective_bucket

                sig do
                  params(
                    effective_bucket:
                      T.nilable(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket::OrHash
                      )
                  ).void
                end
                attr_writer :effective_bucket

                # The checks that the last reported verification attempt failed.
                sig do
                  returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck
                    ]
                  )
                end
                attr_accessor :failed_checks

                sig { returns(Symbol) }
                attr_accessor :type

                # The region stopped retrying verification before the configured bucket passed. To
                # restart verification, send the region a bucket again. It can be the same bucket.
                sig do
                  params(
                    effective_bucket:
                      T.nilable(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket::OrHash
                      ),
                    failed_checks:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::OrHash
                      ],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The bucket that the region applies now. While a replacement bucket is `pending`
                  # or `failed`, this is the previous bucket. `null` when the region applies no
                  # bucket.
                  effective_bucket:,
                  # The checks that the last reported verification attempt failed.
                  failed_checks:,
                  type: :failed
                )
                end

                sig do
                  override.returns(
                    {
                      effective_bucket:
                        T.nilable(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket
                        ),
                      failed_checks:
                        T::Array[
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck
                        ],
                      type: Symbol
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
