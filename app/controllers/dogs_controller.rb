class DogsController < ApplicationController
  # The controller for users.  Makes an implicit call to render "views/users/method_name.html.erb" at the end of every method.

  def index
    @dogs = Dog.all # Get's all the Dogs in our database and assigns it the the instance variable @dog.
  end

  def new
    @dog = Dog.new #Creates an empty dog object.
  end

  def create
    @dogs = Dog.create(dog_params)
    if @dogs.save 
      redirect_to @dogs
    else
      render "new" 
    end
  end

  def show
    @dogs = Dog.find(params[:id]) # Query for the user with the id that is in params
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age) #Returns a hash that was the value of "name" and "email" from the value of "user" in params.
  end
end