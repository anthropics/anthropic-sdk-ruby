# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesExclude < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The destination covers every workspace of the organization except the workspaces
          # on its list. A workspace created later is covered until it is added to the list.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :exclude)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
