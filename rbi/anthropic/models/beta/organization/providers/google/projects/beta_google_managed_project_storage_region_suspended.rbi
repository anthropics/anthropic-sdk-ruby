# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageRegionSuspended < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended,
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

                sig { returns(Symbol) }
                attr_accessor :type

                # Anthropic has withdrawn or paused its approval of customer-owned storage for
                # this project, so the region does not apply the control.
                sig do
                  params(
                    effective_bucket:
                      T.nilable(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket::OrHash
                      ),
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The bucket that the region applies now. While a replacement bucket is `pending`
                  # or `failed`, this is the previous bucket. `null` when the region applies no
                  # bucket.
                  effective_bucket:,
                  type: :suspended
                )
                end

                sig do
                  override.returns(
                    {
                      effective_bucket:
                        T.nilable(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket
                        ),
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
