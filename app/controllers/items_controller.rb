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
   @item = Item.new
   
   @item.titre = "#{item_params[:titre]}"
   @item.contenu = "#{item_params[:contenu]}"
   @item.image = "/items/#{item_params[:image].original_filename}"
   
   if @item.save
     #render "index"
     #redirect_to "index"
     #redirect_to @item
     
     if File.exist?("public/items/#{item_params[:image].original_filename}")
       FileUtils.rm("public/items/#{item_params[:image].original_filename}")
     end
     FileUtils.cp item_params[:image].tempfile, "public/items/#{item_params[:image].original_filename}"
     
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
   item_image = @item.image
   
   Rails.logger.debug("items#DELETE = #{@item.inspect}")
   Rails.logger.debug("items#DELETE item_image = #{item_image}")
   
   if !@item.image.nil? && File.exist?("public#{@item.image}")
     if FileUtils.rm("public#{@item.image}") && @item.destroy
       redirect_to root_path, flash: { notice: "Suppression item OK!!!" }         
     else
       redirect_to root_path, flash: { alert: "ERREUR supp item !!!" }
     end
   else
     if @item.destroy
      redirect_to root_path, flash: { notice: "Suppression item OK!!!" }         
     else
       redirect_to root_path, flash: { alert: "ERREUR supp item !!!" }
     end
   end
 end
 
 def edit
   @item = Item.find(params[:id])
   Rails.logger.debug("items#edit = #{@item.inspect}")
 end
 
 def update
   @item = Item.find(params[:id])
   Rails.logger.debug("items#update = #{@item.inspect}")
   #Rails.logger.debug("items#update params = #{params}")
   Rails.logger.debug("items#update item_params = #{item_params}")
   Rails.logger.debug("TESTTTTTTTTTTTTTTTTT = #{item_params[:image].original_filename}")
   
   @item.titre = "#{item_params[:titre]}"
   @item.contenu = "#{item_params[:contenu]}"
   @item.image = "/items/#{item_params[:image].original_filename}"
   
   if File.exist?("public/items/#{item_params[:image].original_filename}")
     FileUtils.rm("public/items/#{item_params[:image].original_filename}")
     Rails.logger.debug("suppression du fichier")
     sleep 5
   end
   FileUtils.cp item_params[:image].tempfile, "public/items/#{item_params[:image].original_filename}"
   
   #if @item.update(item_params)
   if @item.save
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
      params.require(:item).permit(:titre, :contenu, :image)
    end
end
