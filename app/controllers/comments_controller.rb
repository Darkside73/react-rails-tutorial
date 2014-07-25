class CommentsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    respond_with comments
  end

  def create
    comment = { author: params[:author], text: params[:text] }
    respond_with comments << comment, location: root_url, status: :created
  end

  private

  def comments
    [
      {author: "Pete Hunt", text: "This is one comment"},
      {author: "Jordan Walke", text: "This is *another* comment"}
    ]
  end
end
