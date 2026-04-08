# typed: strong

module Anthropic
  module Resources
    class Beta
      class Environments
        # Create a new environment with the specified configuration.
        sig do
          params(
            name: String,
            config: T.nilable(Anthropic::Beta::BetaCloudConfigParams::OrHash),
            description: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaEnvironment)
        end
        def create(
          # Body param: Human-readable name for the environment
          name:,
          # Body param: Request params for `cloud` environment configuration.
          #
          # Fields default to null; on update, omitted fields preserve the existing value.
          config: nil,
          # Body param: Optional description of the environment
          description: nil,
          # Body param: User-provided metadata key-value pairs
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Retrieve a specific environment by ID.
        sig do
          params(
            environment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaEnvironment)
        end
        def retrieve(
          environment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update an existing environment's configuration.
        sig do
          params(
            environment_id: String,
            config: T.nilable(Anthropic::Beta::BetaCloudConfigParams::OrHash),
            description: T.nilable(String),
            metadata: T::Hash[Symbol, T.nilable(String)],
            name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaEnvironment)
        end
        def update(
          # Path param
          environment_id,
          # Body param: Request params for `cloud` environment configuration.
          #
          # Fields default to null; on update, omitted fields preserve the existing value.
          config: nil,
          # Body param: Updated description of the environment
          description: nil,
          # Body param: User-provided metadata key-value pairs. Set a value to null or empty
          # string to delete the key.
          metadata: nil,
          # Body param: Updated name for the environment
          name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List environments with pagination support.
        sig do
          params(
            include_archived: T::Boolean,
            limit: Integer,
            page: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Beta::BetaEnvironment]
          )
        end
        def list(
          # Query param: Include archived environments in the response
          include_archived: nil,
          # Query param: Maximum number of environments to return
          limit: nil,
          # Query param: Opaque cursor from previous response for pagination. Pass the
          # `next_page` value from the previous response.
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Delete an environment by ID. Returns a confirmation of the deletion.
        sig do
          params(
            environment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaEnvironmentDeleteResponse)
        end
        def delete(
          environment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive an environment by ID. Archived environments cannot be used to create new
        # sessions.
        sig do
          params(
            environment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaEnvironment)
        end
        def archive(
          environment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
