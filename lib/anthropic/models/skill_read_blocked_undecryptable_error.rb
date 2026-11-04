# frozen_string_literal: true

module Anthropic
  module Models
    # A custom skill the request names is stored under an encryption key state the
    # workspace cannot currently decrypt.
    class SkillReadBlockedUndecryptableError < Anthropic::Errors::ConflictError
      # @!method error_code
      #   @return [Symbol, :skill_read_blocked_undecryptable]

      # @return [Anthropic::Models::SkillReadBlockedUndecryptableErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::SkillReadBlockedUndecryptableErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
