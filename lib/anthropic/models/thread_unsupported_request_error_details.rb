# frozen_string_literal: true

module Anthropic
  module Models
    class ThreadUnsupportedRequestErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :thread_unsupported_request]
      required :error_code, const: :thread_unsupported_request

      # @!attribute unsupported
      #   Each entry names a request field or an organization setting that Threads do not
      #   support. On a value you do not recognize, send the full conversation without
      #   `thread`.
      #
      #   @return [Array<Symbol, Anthropic::Models::ThreadUnsupportedFeatureName>, nil]
      optional :unsupported,
               -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::ThreadUnsupportedFeatureName] },
               nil?: true

      # @!method initialize(unsupported: nil, error_code: :thread_unsupported_request)
      #   The request combines `thread` with a request field or an organization setting
      #   that Threads do not support; `unsupported`, when present, names it. Send the
      #   full conversation without `thread`, or change that field.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ThreadUnsupportedRequestErrorDetails} for more details.
      #
      #   @param unsupported [Array<Symbol, Anthropic::Models::ThreadUnsupportedFeatureName>, nil] Each entry names a request field or an organization setting that Threads do not
      #
      #   @param error_code [Symbol, :thread_unsupported_request]
    end
  end
end
