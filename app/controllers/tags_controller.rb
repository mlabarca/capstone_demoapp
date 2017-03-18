class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    tags = Tag.all
    tags = tags.where('name ILIKE ?', "%#{params[:term]}%") if params[:term].present?
    render json: tags.as_json, status: :ok
  end


end
