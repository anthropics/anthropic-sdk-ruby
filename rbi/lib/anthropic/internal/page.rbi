# typed: strong

module Anthropic
  module Internal
    class Page
      Elem = type_member

      include Anthropic::Internal::Type::BasePage

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :first_id

      sig { returns(T.nilable(String)) }
      attr_accessor :last_id

      sig { returns(String) }
      def inspect
      end
    end
  end
end
