class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = current_user.todos
    respond_to do |format|
      format.json { render json: @todos }
    end
  end

  def show
  end

  def new
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.find(params[:id])
  end

  def create
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.create(todo_params)

    if @todo.valid?
      respond_to do |format|
        format.html { redirect_to user_path}
        format.js
      end
    else
      render :new
    end
  end

  def update
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.find(params[:id])
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to [:user], notice: 'Todo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.find(params[:id])
    respond_to do |format|
      if @todo.destroy!
        format.html { redirect_to [:user], notice: 'Todo was successfully removed.' }
      else
        format.html { render [:user], notice: 'There was an error. Todo was not removed' }
      end
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:details, :location)
    end
end
