ActiveAdmin.register Request do
  member_action :approve, method: :put do
    resource.approved!
    redirect_to admin_requests_path, notice: 'Approved!'
  end

  member_action :deny, method: :put do
    resource.denied!
    redirect_to admin_requests_path, notice: 'Denied!'
  end

  index do
    column :id
    column :status
    column :book
    column :user
    actions defaults: true do |request|
      links = []
      if request.status == 'pending'
        links << link_to(
          'Approve', approve_admin_request_path(request.id),
          method: :put
        )
        links << link_to(
          'Deny', deny_admin_request_path(request.id),
          method: :put
        )
      end
      raw links.join('  |  ')
    end
  end
end
