# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileResource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileResource,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :file_id

          sig { returns(String) }
          attr_accessor :mount_path

          sig { returns(Symbol) }
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :updated_at

          sig do
            params(
              id: String,
              created_at: Time,
              file_id: String,
              mount_path: String,
              updated_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # A timestamp in RFC 3339 format
            created_at:,
            file_id:,
            mount_path:,
            # A timestamp in RFC 3339 format
            updated_at:,
            type: :file
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                file_id: String,
                mount_path: String,
                type: Symbol,
                updated_at: Time
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
