class CommentsController < ApplicationController
  respond_to :json

  def index
    respond_with [
      {author: "Pete Hunt", text: "This is one comment"},
      {author: "Jordan Walke", text: "This is *another* comment"}
    ]
  end
end
