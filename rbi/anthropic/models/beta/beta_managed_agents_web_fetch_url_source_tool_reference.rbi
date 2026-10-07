# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceToolReference =
      Beta::BetaManagedAgentsWebFetchURLSourceToolReference

    module Beta
      class BetaManagedAgentsWebFetchURLSourceToolReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the tool. Compared exactly, so upper and lower case letters are
        # different.
        sig { returns(String) }
        attr_accessor :name

        # Must be "tool_reference".
        sig { returns(Symbol) }
        attr_accessor :type

        # Names one tool in an only or except list.
        sig { params(name: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Name of the tool. Compared exactly, so upper and lower case letters are
          # different.
          name:,
          # Must be "tool_reference".
          type: :tool_reference
        )
        end

        sig { override.returns({ name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
