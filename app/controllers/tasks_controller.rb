class TasksController < ApplicationController
   

    def index
        @tasks = policy_scope(Task)
        @tasks_in_progress = @tasks.where(realized: false)
        @tasks_done = @tasks.where(realized: true)
        @task = Task.new
        @comment = Comment.new
        @user = current_user
    end

    def new
        @user = current_user
        @task = Task.new
        authorize @task
        @task.user = @user
    end

    def create
        @user = current_user
        @task = Task.new
        authorize @task
        @task.user = @user
        @task.name = task_params[:name]
        @task.description = task_params[:description]
        @task.deadline = task_params[:deadline]
        @task.priority = task_params[:priority]
        @task.save

        if @task.save
            redirect_to tasks_path
        end
    end

    def done
        @task = Task.find(params[:id])
        authorize @task
        @task.realized = true
        @task.save

        if @task.save
            redirect_to tasks_path
        end
    end

    def show
        @task = Task.find(params[:id])
        @comment = Comment.new
    end

    def destroy
        @task = Task.find(params[:id])
        authorize @task
        @task.destroy
    end


    def edit
       @task = Task.last
    end



    private

    def task_params
        params.require(:task).permit(:name, :description, :deadline, :priority)
    end
end
