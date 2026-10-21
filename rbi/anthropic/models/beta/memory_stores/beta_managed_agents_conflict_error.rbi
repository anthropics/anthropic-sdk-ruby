# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsConflictError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictError,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          sig do
            params(message: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(message: nil, type: :conflict_error)
          end

          sig { override.returns({ type: Symbol, message: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
