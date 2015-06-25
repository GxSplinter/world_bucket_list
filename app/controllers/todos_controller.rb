class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
    render json: Todo.all
    render json: {}
  end

  # GET /todos/1
  # GET /todos/1.json
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

  # GET /todos/1/edit
  def edit
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
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

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
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

  # DELETE /todos/1
  # DELETE /todos/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:details, :location)
    end
end
