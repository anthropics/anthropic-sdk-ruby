# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageDisabled < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Buckets that a region has retired, earliest `expires_at` first.
              sig do
                returns(
                  T::Array[
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket
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
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket::OrHash
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
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket
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
