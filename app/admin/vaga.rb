ActiveAdmin.register Vaga do

permit_params :list, :of, :attributes, :on, :model

# or

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
