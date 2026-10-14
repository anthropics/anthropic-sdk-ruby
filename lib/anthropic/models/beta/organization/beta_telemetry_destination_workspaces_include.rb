# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesInclude < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :include]
          required :type, const: :include

          # @!method initialize(type: :include)
          #   The destination covers the workspaces on its list, and no others.
          #
          #   @param type [Symbol, :include]
        end
      end
    end
  end
end
