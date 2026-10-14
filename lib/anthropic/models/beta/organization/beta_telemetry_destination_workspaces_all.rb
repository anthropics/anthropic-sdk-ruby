# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationWorkspacesAll < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :all]
          required :type, const: :all

          # @!method initialize(type: :all)
          #   The destination covers every workspace of the organization, including the
          #   default workspace, archived workspaces, and workspaces created later. It doesn't
          #   have a list.
          #
          #   @param type [Symbol, :all]
        end
      end
    end
  end
end
