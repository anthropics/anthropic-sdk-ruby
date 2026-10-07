# typed: strong

module Anthropic
  module Models
    class BrowserRefTarget < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserRefTarget, Anthropic::Internal::AnyHash)
        end

      # An element reference (e.g. "ref_7") returned by a prior `read_page` or `find`
      # result.
      sig { returns(String) }
      attr_accessor :ref

      sig { returns(Symbol) }
      attr_accessor :type

      # An element on the page, identified by a reference from a prior `read_page` or
      # `find` result. References are scoped to the tab that produced them and become
      # stale after navigation or a major re-render.
      sig { params(ref: String, type: Symbol).returns(T.attached_class) }
      def self.new(
        # An element reference (e.g. "ref_7") returned by a prior `read_page` or `find`
        # result.
        ref:,
        type: :ref
      )
      end

      sig { override.returns({ ref: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
