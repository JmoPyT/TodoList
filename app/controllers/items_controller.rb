class ItemsController < ApplicationController
  def index
    @items = Item.all
    Rails.logger.debug("items = #{@items.nil?}")
    Rails.logger.debug("items = #{@items.inspect}")
  end
  
  def new
    @item = Item.new
    Rails.logger.debug("erreur = #{@item.errors.messages.nil?}")
  end
  
  def create
   @item = Item.new(item_params)
   
   if @item.save
     #render "index"
     #redirect_to "index"
     #redirect_to @item
     redirect_to root_path, flash: { notice: "Insertion OK!!!" }
   else     
     Rails.logger.debug("erreur = #{@item.errors.messages}")
     Rails.logger.debug("erreur = #{@item.errors.full_messages}")
     Rails.logger.debug("erreur = #{@item.errors.messages.nil?}")
     
     render "new"
     #redirect_to root_path, flash: { alert: "ERREUR !!!" }
   end
 end
 
 def show
   @item = Item.find(params[:id])
   
   Rails.logger.debug("items = #{@item.inspect}")
 end
 
 def destroy
   @item = Item.find(params[:id])
   
   Rails.logger.debug("items#DELETE = #{@item.inspect}")
   
   if @item.destroy
     redirect_to root_path, flash: { notice: "Suppression item OK!!!" }
   else
     redirect_to root_path, flash: { alert: "ERREUR supp item !!!" }
   end
 end
 
 def edit
   @item = Item.find(params[:id])
   Rails.logger.debug("items#edit = #{@item.inspect}")
 end
 
 def update
   @item = Item.find(params[:id])
   #Rails.logger.debug("items#update = #{@item.inspect}")
   #Rails.logger.debug("items#update params = #{params}")
   Rails.logger.debug("items#update item_params = #{item_params}")
   
   if @item.update(item_params)
    redirect_to root_path, flash: { notice: "Modification item OK!!!" }
   else
     Rails.logger.debug("erreur = #{@item.errors.messages}")
     Rails.logger.debug("erreur = #{@item.errors.full_messages}")
     Rails.logger.debug("erreur = #{@item.errors.messages.nil?}")
     
     render "edit"
     #redirect_to root_path, flash: { alert: "ERREUR modif item !!!" }
   end
 end
   
  
  
  private
    def item_params # à partir de Rails 4
      params.require(:item).permit(:titre, :contenu, :image[:tempfile].read)
    end
end
