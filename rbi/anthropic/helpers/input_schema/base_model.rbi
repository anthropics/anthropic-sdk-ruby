# typed: strong

module Anthropic
  module Helpers
    module InputSchema
      # Represents a response from Anthropic's API where the model's output has been structured according to a schema predefined by the user.
      #
      # This class is specifically used when making requests with the `response_format` parameter set to use structured output (e.g., JSON).
      #
      # See {examples/input_schemas.rb} for a complete example of use
      class BaseModel < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Helpers::InputSchema::JsonSchemaConverter

        class << self
          sig { params(doc: T.nilable(String)).void }
          attr_writer :doc
        end
      end
    end
  end
end
