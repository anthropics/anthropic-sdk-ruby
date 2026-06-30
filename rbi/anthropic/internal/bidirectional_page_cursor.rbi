# typed: strong

module Anthropic
  module Internal
    class BidirectionalPageCursor
      include Anthropic::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(T.nilable(String)) }
      attr_accessor :next_page_

      sig { returns(T.nilable(String)) }
      attr_accessor :prev_page

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
