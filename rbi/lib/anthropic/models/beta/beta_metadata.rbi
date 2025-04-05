# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaMetadata < Anthropic::Internal::Type::BaseModel
        # An external identifier for the user who is associated with the request.
        #
        # This should be a uuid, hash value, or other opaque identifier. Anthropic may use
        # this id to help detect abuse. Do not include any identifying information such as
        # name, email address, or phone number.
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

        sig { params(user_id: T.nilable(String)).returns(T.attached_class) }
        def self.new(user_id: nil); end

        sig { override.returns({user_id: T.nilable(String)}) }
        def to_hash; end
      end
    end

    BetaMetadata = Beta::BetaMetadata
  end
end
