# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Providers
          class Google
            sig do
              returns(
                Anthropic::Resources::Beta::Organization::Providers::Google::Projects
              )
            end
            attr_reader :projects

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
