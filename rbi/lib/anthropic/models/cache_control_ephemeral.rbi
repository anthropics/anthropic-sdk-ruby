# typed: strong

module Anthropic
  module Models
    class CacheControlEphemeral < Anthropic::BaseModel
      Shape = T.type_alias { {type: Symbol} }

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(type: Symbol).void }
      def initialize(type: :ephemeral); end

      sig { returns(Anthropic::Models::CacheControlEphemeral::Shape) }
      def to_h; end
    end
  end
end
