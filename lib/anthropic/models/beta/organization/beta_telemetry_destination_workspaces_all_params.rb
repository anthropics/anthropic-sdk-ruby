# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesAllParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :all]
          required :type, const: :all

          # @!method initialize(type: :all)
          #   Cover every workspace of the organization. Doesn't take `workspace_ids`.
          #
          #   An update that sets `all` empties the destination's workspace list.
          #
          #   @param type [Symbol, :all]
        end
      end
    end
  end
end
