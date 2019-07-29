class TodosController < ApplicationController

  def index
    @todo = Todo.new
    @todos = Todo.order('created_at ASC')
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      respond_to do |format|
        format.html { redirect_to todos_path }
        format.json
      end
    else
      render :index
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:content)
  end
end
