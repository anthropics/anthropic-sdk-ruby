# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentArchivedRunErrorObject =
      Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject

    module Beta
      class BetaManagedAgentsEnvironmentArchivedRunErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment's environment was archived.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :environment_archived_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
