ActiveAdmin.register Book do

  permit_params :title, :author_id, :description, :image, :year
  index do
    selectable_column
    id_column
    column :title
    column :author
    column :Description
    column :year
    column :created_at
    column :updated_at
    actions
  end

end
