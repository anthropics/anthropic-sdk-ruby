# frozen_string_literal: true

module Anthropic
  module Models
    class ThreadAlreadyContinuedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :thread_already_continued]
      required :error_code, const: :thread_already_continued

      # @!method initialize(error_code: :thread_already_continued)
      #   The response that `previous_message_id` names has already been continued, and
      #   each response can be continued only once. Continue from the Thread's most recent
      #   response `id`.
      #
      #   @param error_code [Symbol, :thread_already_continued]
    end
  end
end
