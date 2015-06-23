class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  def new
    @destination = current_user.destinations.find(params[:destination_id])
    @todo = @destination.todos.new
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
      redirect_to user_path
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to [:user], notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
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
      params.require(:todo).permit(:details)
    end
end
