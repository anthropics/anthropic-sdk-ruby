# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsDeleteSessionResource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Confirmation of resource deletion.
          sig do
            params(
              id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(id:, type:)
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_RESOURCE_DELETED =
              T.let(
                :session_resource_deleted,
                Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type::TaggedSymbol
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
