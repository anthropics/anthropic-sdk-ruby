# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentParams = Beta::BetaManagedAgentsAgentParams

    module Beta
      class BetaManagedAgentsAgentParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The `agent` ID.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :type

        # The specific `agent` version to use. Omit to use the latest version. Must be at
        # least 1 if specified.
        sig { returns(T.nilable(Integer)) }
        attr_reader :version

        sig { params(version: Integer).void }
        attr_writer :version

        # Specification for an Agent. Provide a specific `version` or use the short-form
        # `agent="agent_id"` for the most recent version
        sig do
          params(id: String, version: Integer, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The `agent` ID.
          id:,
          # The specific `agent` version to use. Omit to use the latest version. Must be at
          # least 1 if specified.
          version: nil,
          type: :agent
        )
        end

        sig { override.returns({ id: String, type: Symbol, version: Integer }) }
        def to_hash
        end
      end
    end
  end
end
