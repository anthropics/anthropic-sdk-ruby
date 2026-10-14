# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesInclude < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The destination covers the workspaces on its list, and no others.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :include)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
