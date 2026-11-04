# typed: strong

module Anthropic
  module Errors
    # @api private
    ERROR_CLASSES =
      T.let(
        T.unsafe(nil),
        T::Hash[
          [Integer, T.nilable(String)],
          T::Class[Anthropic::Errors::APIStatusError]
        ]
      )
  end
end
