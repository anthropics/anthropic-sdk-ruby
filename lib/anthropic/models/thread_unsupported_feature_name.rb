# frozen_string_literal: true

module Anthropic
  module Models
    module ThreadUnsupportedFeatureName
      extend Anthropic::Internal::Type::Enum

      CACHE_CONTROL = :cache_control
      CONTEXT_MANAGEMENT = :context_management
      FALLBACKS = :fallbacks
      HIPAA = :hipaa
      INFERENCE_HOOKS = :inference_hooks
      THINKING = :thinking
      ZDR = :zdr

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
