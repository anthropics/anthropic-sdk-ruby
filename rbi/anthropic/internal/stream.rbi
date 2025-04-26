# typed: strong

module Anthropic
  module Internal
    class Stream
      Message = type_member(:in) { {fixed: Anthropic::Internal::Util::ServerSentEvent} }
      Elem = type_member(:out)

      include Anthropic::Internal::Type::BaseStream

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator; end
    end
  end
end
