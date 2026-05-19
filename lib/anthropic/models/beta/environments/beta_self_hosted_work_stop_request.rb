# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkStopRequest < Anthropic::Internal::Type::BaseModel
          # @!attribute force
          #   If true, immediately stop work without graceful shutdown
          #
          #   @return [Boolean, nil]
          optional :force, Anthropic::Internal::Type::Boolean

          # @!method initialize(force: nil)
          #   Request to stop a work item.
          #
          #   @param force [Boolean] If true, immediately stop work without graceful shutdown
        end
      end
    end
  end
end
