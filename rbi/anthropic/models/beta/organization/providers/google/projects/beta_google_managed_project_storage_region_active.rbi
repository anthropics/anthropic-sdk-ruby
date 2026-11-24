# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageRegionActive < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive,
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

                # The checks that the latest reported daily verification failed. Empty when it
                # passed.
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

                # When the status last became `active`, in RFC 3339 format.
                sig { returns(Time) }
                attr_accessor :validated_at

                # The configured bucket passed verification, and the region applies it.
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
                    validated_at: Time,
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The bucket that the region applies now. While a replacement bucket is `pending`
                  # or `failed`, this is the previous bucket. `null` when the region applies no
                  # bucket.
                  effective_bucket:,
                  # The checks that the latest reported daily verification failed. Empty when it
                  # passed.
                  failed_checks:,
                  # When the status last became `active`, in RFC 3339 format.
                  validated_at:,
                  type: :active
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
                      type: Symbol,
                      validated_at: Time
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
