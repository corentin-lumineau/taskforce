class CommentsController < ApplicationController

    def create
        @task = Task.find(params[:task_id])
        @comment = Comment.new
        authorize @comment
        @comment.task_id = @task.id
        @comment.content = comment_params[:content]
        @comment.save!

        if @task.save
            redirect_to tasks_path
        end
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
