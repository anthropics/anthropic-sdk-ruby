# typed: strong

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class Providers
          class Google
            sig do
              returns(
                Anthropic::Resources::Beta::UserProfiles::Providers::Google::DataControls
              )
            end
            attr_reader :data_controls

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
