class TasksController < ApplicationController
   

    def index
        @tasks = policy_scope(Task)
        @tasks_in_progress = @tasks.where(realized: false)
        @tasks_done = @tasks.where(realized: true)
        @task = Task.new
        @comment = Comment.new
        @user = current_user
        

        respond_to do |format|
            format.html
            format.json { render json: { html: render_to_string('index')} }
        end

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
        @task.save!

        if @task.save
            redirect_to tasks_path
        end
    end

    def done
        @task = Task.find(params[:id])
        authorize @task
        @task.realized = true
        @task.save!

        if @task.save
            redirect_to task_path(@task)
        end
    end

    def show
        raise
        @task = Task.find(params[:id])
        @comment = Comment.new
    end

    def fetch
        render json: {html: render_to_string(partial: "task", locals: {task: @task})} 
    end

    def destroy
        @task = Task.find(params[:id])
        authorize @task
        @task.destroy
    end



    def edit
       @task = Task.last
    end

    # def update
    #     @task = 
    #     @task.name = task_params["name"]
    #     @task.description = task_params["description"]
    #     @task.deadline = task_params["deadline"]
    #     @task.priority = task_params["priority"]
    # end

    private

    def task_params
        params.require(:task).permit(:name, :description, :deadline, :priority)
    end
end
