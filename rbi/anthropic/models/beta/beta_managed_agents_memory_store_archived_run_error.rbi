# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStoreArchivedRunError =
      Beta::BetaManagedAgentsMemoryStoreArchivedRunError

    module Beta
      class BetaManagedAgentsMemoryStoreArchivedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A memory store referenced by the deployment is archived.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE_ARCHIVED_ERROR =
            T.let(
              :memory_store_archived_error,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type::TaggedSymbol
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
