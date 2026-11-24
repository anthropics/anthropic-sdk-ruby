# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageRegionPending < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The bucket that the region applies now. While a replacement bucket is `pending`
              # or `failed`, this is the previous bucket. `null` when the region applies no
              # bucket.
              sig do
                returns(
                  T.nilable(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference
                  )
                )
              end
              attr_reader :effective_bucket

              sig do
                params(
                  effective_bucket:
                    T.nilable(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference::OrHash
                    )
                ).void
              end
              attr_writer :effective_bucket

              # The checks that the latest reported verification attempt failed. Empty when none
              # has failed.
              sig do
                returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck
                  ]
                )
              end
              attr_accessor :failed_checks

              sig { returns(Symbol) }
              attr_accessor :type

              # The region is verifying the configured bucket.
              sig do
                params(
                  effective_bucket:
                    T.nilable(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference::OrHash
                    ),
                  failed_checks:
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::OrHash
                    ],
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The bucket that the region applies now. While a replacement bucket is `pending`
                # or `failed`, this is the previous bucket. `null` when the region applies no
                # bucket.
                effective_bucket:,
                # The checks that the latest reported verification attempt failed. Empty when none
                # has failed.
                failed_checks:,
                type: :pending
              )
              end

              sig do
                override.returns(
                  {
                    effective_bucket:
                      T.nilable(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference
                      ),
                    failed_checks:
                      T::Array[
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck
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
