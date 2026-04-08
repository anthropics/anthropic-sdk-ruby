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

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type::TaggedSymbol
            )
          end
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
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type::OrSymbol,
              updated_at: Time
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # A timestamp in RFC 3339 format
            created_at:,
            file_id:,
            mount_path:,
            type:,
            # A timestamp in RFC 3339 format
            updated_at:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                file_id: String,
                mount_path: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type::TaggedSymbol,
                updated_at: Time
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FILE =
              T.let(
                :file,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
