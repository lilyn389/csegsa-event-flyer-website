class FlyersController < ApplicationController
  before_action :require_login, only: [:show, :archive_show, :index, :archive, :new, :create, :edit, :update, :destroy]
  
  def flyer_params
    params.require(:flyer).permit(:title, :description, :location, :event_date, :uploader, :display_date, :image, :is_live, :custFlyer, :defaultBg)
  end

  def show
    id = params[:id] # retrieve flyer ID from URI route
    @flyer = Flyer.find(id) # look up flyer by unique ID
    # will render app/views/flyers/show.<extension> by default
  end

  def archive_show
    id = params[:id] # retrieve flyer ID from URI route
    @flyer = Flyer.find(id) # look up flyer by unique ID
    # will render app/views/flyers/show.<extension> by default
  end

  def index
    Flyer.auto_archive
    @sort = params[:sort]
    @flyers = Flyer.where(:is_live => '1').order(@sort)
  end

  def archive
    @sort = params[:sort]
    @flyers = Flyer.where(:is_live => '0').order(@sort)
  end

  def slideshow
    Flyer.auto_archive
    @sort = params[:sort]
    @title = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.title
    }.compact
    @event_date = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.event_date.to_time.strftime("%D %r")
    }.compact
    @loc = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.location
    }.compact
    @desc = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.description.to_s
    }.compact
    @ff = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.custFlyer
    }.compact
    @defaults = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.defaultBg
    }.compact
    @flyer_img_paths = Flyer.where(:is_live => '1').order(@sort).map {
      |f| f.image.url(:original)
    }.compact
  end

  def new
    @default_imgs = Dir.glob("app/assets/images/*.{jpg,png}")
    @default_imgs.delete('no-photo.jpg')
    # default: render 'new' template
  end

  def create
    @flyer = Flyer.create!(flyer_params)
    @flyer.update_attributes(:is_live => '1')
    @flyer.update_attributes(:uploader => current_user.email)
    flash[:notice] = "#{@flyer.title} was successfully created."
    redirect_to flyers_path
  end

  def edit
    @flyer = Flyer.find params[:id]
  end

  def update
    @flyer = Flyer.find params[:id]
    @flyer.update_attributes!(flyer_params)
    if @flyer.is_live == '0'
      flash[:notice] = "Flyer '#{@flyer.title}' was successfully updated."
      redirect_to archive_show_path
    else
      flash[:notice] = "Flyer '#{@flyer.title}' was successfully updated."
      redirect_to flyer_path
    end
  end

  def destroy
    @flyer = Flyer.find(params[:id])
    if @flyer.is_live == '0'
      @flyer.destroy
      flash[:notice] = "Flyer '#{@flyer.title}' deleted."
      redirect_to flyers_archive_path
    else
      @flyer.destroy
      flash[:notice] = "Flyer '#{@flyer.title}' deleted."
      redirect_to flyers_path
    end
  end
  
 

end

