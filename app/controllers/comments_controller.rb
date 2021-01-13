class CommentsController < ApplicationController

    def create
        binding.pry
        @task = Task.find(params[:task_id])
        @comment = Comment.new
        authorize @comment
        @comment.task_id = @task.id
        @comment.content = comment_params[:content]
        @comment.save!
    end

    def new
        @task = Task.find(params[:id])
        @comment = Comment.new
        authorize @comment
    end

    private 

    def comment_params
        params.require(:comment).permit(:content)
    end
end
