# frozen_string_literal: true

module Anthropic
  module Models
    class SkillReadBlockedUndecryptableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :skill_read_blocked_undecryptable]
      required :error_code, const: :skill_read_blocked_undecryptable

      # @!method initialize(error_code: :skill_read_blocked_undecryptable)
      #   A custom skill the request names is stored under an encryption key state the
      #   workspace cannot currently decrypt.
      #
      #   @param error_code [Symbol, :skill_read_blocked_undecryptable]
    end
  end
end
