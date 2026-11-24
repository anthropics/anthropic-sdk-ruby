# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageDisabled < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # Buckets that a region has retired, earliest `expires_at` first.
                sig do
                  returns(
                    T::Array[
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket
                    ]
                  )
                end
                attr_accessor :retired_buckets

                sig { returns(Symbol) }
                attr_accessor :type

                # The control is off and has no buckets.
                sig do
                  params(
                    retired_buckets:
                      T::Array[
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket::OrHash
                      ],
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Buckets that a region has retired, earliest `expires_at` first.
                  retired_buckets:,
                  type: :disabled
                )
                end

                sig do
                  override.returns(
                    {
                      retired_buckets:
                        T::Array[
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket
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
