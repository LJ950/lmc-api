class Api::V1::Authorization::MembersController < Api::V1::Authorization::BaseController
  # For test purposes only - remove when members added to db!
  def index
    @members = Member.all
    render json: @members
  end

  def show
    @member = Member.find(current_user.id)
    render json: @member
  end
end
