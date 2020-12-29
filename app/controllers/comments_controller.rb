class CommentsController < ApplicationController
  def create
    Comment.create(comment)
  end
end
