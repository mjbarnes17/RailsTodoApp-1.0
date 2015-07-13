class ListingsController < ApplicationController
  
  # listings#index, index Action root(/)(/listings)
  def index
    # list all the current values in the list on the root page
    @listings = Listing.all
  end
  
  # listings#new, new Action (/listings/new)
  def new
    # allow user to create a new todo item
    @listing = Listing.new
  end
  
  # listings#create, create Action (/listings)  
  def create
    # enables the user to create a todo item to be stored on the root page
    @listing = Listing.new(listing_params)
    # checks if the new todo item that was created saves
    # if the new todo saves 
    if @listing.save
      # then it will redirect you back to the root page with the new todo item added to the list
      redirect_to listings_path
    else
      # else (does not save) it will render the new Action again
      render 'new'
    end
  end
  
  # listings#edit, deit Action (/listings/:id/edit)
  def edit
    # this allows the user to edit an existing todo item
    # this is done by first finding the the todo items listing params :id
    @listing = Listing.find(params[:id])
  end
  
  
  def update
    # this gets the todo items listing params :id
    @listing = Listing.find(params[:id])
    # if todo listing item updates
    if @listing.update(listing_params)
      # them it will redirect you to the root page along with the updated todo list item
      redirect_to listings_path
    else
      # else (does not update) it will render the edit Action again
      render 'edit'
    end
  end
  
  # listings#show, show Action (/listings/:id)
  def show
    # this gets the todo items listing params :id
    @listing = Listing.find(params[:id])
  end
  
  # listings#destroy, destroy Action (/listings/:id)
  def destroy
    # gets the todo items listing params :id
    @listing = Listing.find(params[:id])
    # destroys the current listing
    @listing.destroy
    
    # redirects you back to the (root) index page
    redirect_to listings_path
  end
  
  # defining listing_params for this classes use only
  private
    def listing_params
      # requires the top level listings key and then allows the description key value to be passed in
      params.require(:listing).permit(:description)
    end
end