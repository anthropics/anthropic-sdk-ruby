# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesExclude < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :exclude]
          required :type, const: :exclude

          # @!method initialize(type: :exclude)
          #   The destination covers every workspace of the organization except the workspaces
          #   on its list. A workspace created later is covered until it is added to the list.
          #
          #   @param type [Symbol, :exclude]
        end
      end
    end
  end
end
