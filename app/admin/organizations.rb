ActiveAdmin.register Organization do
  permit_params :name

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
