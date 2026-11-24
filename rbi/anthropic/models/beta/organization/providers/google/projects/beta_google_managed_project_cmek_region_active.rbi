# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKRegionActive < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionActive,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The ID of the External Key that the region applies now (`ekey_...`). While a
                # replacement key is `pending` or `failed`, this is the previous key. `null` when
                # the region applies no key.
                sig { returns(T.nilable(String)) }
                attr_accessor :effective_external_key_id

                # Why Google Cloud KMS refused the region's latest use of the key. `null` when the
                # region has no refusal to report. A `null` does not mean that the key works.
                sig { returns(T.nilable(String)) }
                attr_accessor :error

                # When the region last got a successful answer from Google Cloud KMS for the key,
                # in RFC 3339 format. `null` when it has none to report.
                sig { returns(T.nilable(Time)) }
                attr_accessor :last_checked_at

                sig { returns(Symbol) }
                attr_accessor :type

                # When the status last became `active`, in RFC 3339 format.
                sig { returns(Time) }
                attr_accessor :validated_at

                # The configured key passed validation, and the region applies it.
                sig do
                  params(
                    effective_external_key_id: T.nilable(String),
                    error: T.nilable(String),
                    last_checked_at: T.nilable(Time),
                    validated_at: Time,
                    type: Symbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The ID of the External Key that the region applies now (`ekey_...`). While a
                  # replacement key is `pending` or `failed`, this is the previous key. `null` when
                  # the region applies no key.
                  effective_external_key_id:,
                  # Why Google Cloud KMS refused the region's latest use of the key. `null` when the
                  # region has no refusal to report. A `null` does not mean that the key works.
                  error:,
                  # When the region last got a successful answer from Google Cloud KMS for the key,
                  # in RFC 3339 format. `null` when it has none to report.
                  last_checked_at:,
                  # When the status last became `active`, in RFC 3339 format.
                  validated_at:,
                  type: :active
                )
                end

                sig do
                  override.returns(
                    {
                      effective_external_key_id: T.nilable(String),
                      error: T.nilable(String),
                      last_checked_at: T.nilable(Time),
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
