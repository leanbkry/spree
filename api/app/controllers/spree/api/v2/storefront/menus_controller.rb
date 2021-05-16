module Spree
  module Api
    module V2
      module Storefront
        class MenusController < ::Spree::Api::V2::ResourceController
          private

          def serialize_collection(collection)
            collection_serializer.new(
              collection,
              collection_options(collection).merge(params: serializer_params)
            ).serializable_hash
          end

          def resource
            scope.find_by(unique_code: params[:unique_code])
          end

          def resource_serializer
            Spree::Api::Dependencies.storefront_menu_serializer.constantize
          end

          def collection_serializer
            Spree::Api::Dependencies.storefront_menu_serializer.constantize
          end

          def collection_finder
            Spree::Api::Dependencies.storefront_menu_finder.constantize
          end

          def model_class
            Spree::Menu
          end

          def scope
            super.by_store(current_store)
          end
        end
      end
    end
  end
end
