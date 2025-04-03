# typed: strong

module Anthropic
  module Internal
    class Stream
      include Anthropic::Internal::Type::BaseStream

      Message = type_member(:in) { {fixed: Anthropic::Internal::Util::ServerSentEvent} }
      Elem = type_member(:out)

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
