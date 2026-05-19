# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSessionWorkData < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSessionWorkData,
                Anthropic::Internal::AnyHash
              )
            end

          # Session identifier (e.g., 'session\_...')
          sig { returns(String) }
          attr_accessor :id

          # Type of work data
          sig { returns(Symbol) }
          attr_accessor :type

          # Work data for session work items.
          #
          # This resource type is used when work represents a session that needs to be
          # executed in a self-hosted environment.
          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # Session identifier (e.g., 'session\_...')
            id:,
            # Type of work data
            type: :session
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
