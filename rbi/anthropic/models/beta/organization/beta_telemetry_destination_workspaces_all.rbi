# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesAll < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAll,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The destination covers every workspace of the organization, including the
          # default workspace, archived workspaces, and workspaces created later. It doesn't
          # have a list.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :all)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
