class TasksController < ApplicationController
   

    def index
        @tasks = Task.all
        @task = Task.new
        @user = current_user

        respond_to do |format|
            format.html
            format.json { render json: { html: render_to_string('index')} }
        end

    end

    def new
        @user = current_user
        @task = Task.new
        @task.user = @user
    end

    def create
        @user = current_user
        @task = Task.new
        @task.user = @user
        @task.name = task_params[:name]
        @task.description = task_params[:description]
        @task.deadline = task_params[:deadline]
        @task.priority = task_params[:priority]
        @task.save!
    end

    def fetch
        render json: {html: render_to_string(partial: "task", locals: {task: @task})} 
    end

    def destroy
        @task = Task.find(params[:id])
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
