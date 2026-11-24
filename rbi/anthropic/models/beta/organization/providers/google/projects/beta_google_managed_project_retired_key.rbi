# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectRetiredKey < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # When this entry is removed, in RFC 3339 format.
                sig { returns(Time) }
                attr_accessor :expires_at

                # The ID of the retired External Key (`ekey_...`).
                sig { returns(String) }
                attr_accessor :external_key_id

                # The code of the region that retired the key.
                sig { returns(String) }
                attr_accessor :region

                # A key that a region has retired. Keep the key usable until `expires_at`.
                sig do
                  params(
                    expires_at: Time,
                    external_key_id: String,
                    region: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # When this entry is removed, in RFC 3339 format.
                  expires_at:,
                  # The ID of the retired External Key (`ekey_...`).
                  external_key_id:,
                  # The code of the region that retired the key.
                  region:
                )
                end

                sig do
                  override.returns(
                    {
                      expires_at: Time,
                      external_key_id: String,
                      region: String
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
