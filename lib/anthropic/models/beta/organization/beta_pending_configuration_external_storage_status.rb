# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPendingConfigurationExternalStorageStatus < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :pending_configuration]
          required :type, const: :pending_configuration

          # @!method initialize(type: :pending_configuration)
          #   The storage isn't verified yet.
          #
          #   @param type [Symbol, :pending_configuration]
        end
      end
    end
  end
end
