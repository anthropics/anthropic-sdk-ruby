# typed: strong

module Anthropic
  module Models
    class WebFetchURLSourceAll < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebFetchURLSourceAll, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      # The `url_sources` variant under which a source contributes in full: every result
      # of the tool filter's source, or all user input.
      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(type: :all)
      end

      sig { override.returns({ type: Symbol }) }
      def to_hash
      end
    end
  end
end
