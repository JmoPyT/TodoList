##
# Controller pour les items
class ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.paginate(page: params[:page_item], per_page: 3)
    @users = User.paginate(page: params[:page_user], per_page: 5)
    # Rails.logger.debug("items = #{@items.nil?}")
  end

  def new
    @item = Item.new
    @users = User.all
    # Rails.logger.debug("erreur = #{@item.errors.messages.nil?}")
  end

  def create
    @item = Item.new(item_params)
    @item.image = params[:item][:image]

    # @item.titre = "#{item_params[:titre]}"
    # @item.contenu = "#{item_params[:contenu]}"
    # @item.image = "/items/#{item_params[:image].original_filename}" unless item_params[:image].nil?

    if @item.save
      # render "index"
      # redirect_to "index"
      # redirect_to @item

      # if File.exist?("public/items/#{item_params[:image].original_filename}")
      #  FileUtils.rm("public/items/#{item_params[:image].original_filename}")
      # end
      # FileUtils.cp item_params[:image].tempfile, "public/items/#{item_params[:image].original_filename}"

      redirect_to root_path, flash: { notice: 'Insertion OK!!!' }
    else
      # Rails.logger.debug("erreur = #{@item.errors.messages}")
      # Rails.logger.debug("erreur = #{@item.errors.full_messages}")
      # Rails.logger.debug("erreur = #{@item.errors.messages.nil?}")
      render 'new'
      # redirect_to root_path, flash: { alert: "ERREUR !!!" }
    end
  end

  def show
    @item = Item.find(params[:id])
    # Rails.logger.debug("items = #{@item.inspect}")
  end

  def destroy
    @item = Item.find(params[:id])
    # Rails.logger.debug("items#DELETE = #{@item.inspect}")
    # if File.exist?("public#{@item.image}") && FileUtils.rm("public#{@item.image}") && @item.destroy
    if @item.destroy
      # Rails.logger.debug("items#DELETE SUPPRESSION DE IMAGE")
      redirect_to root_path, flash: { notice: t('notice.delete_item') }
    else
      redirect_to root_path, flash: { alert: t('alert.delete_item') }
    end
  end

  def edit
    @item = Item.find(params[:id])
    # Rails.logger.debug("items#edit = #{@item.inspect}")
    @users = User.all
  end

  def update
    @item = Item.find(params[:id])

    # Rails.logger.debug("items#update = #{@item.inspect}")
    # Rails.logger.debug("items#update params = #{params}")
    # Rails.logger.debug("items#update item_params = #{item_params}")

    # @item.titre = "#{item_params[:titre]}"
    # @item.contenu = "#{item_params[:contenu]}"

    # unless item_params[:image].nil?
    #  @item.image = "/items/#{item_params[:image].original_filename}"

    #  if File.exist?("public/items/#{item_params[:image].original_filename}")
    #    FileUtils.rm("public/items/#{item_params[:image].original_filename}")
    #  end
    #  FileUtils.cp item_params[:image].tempfile, "public/items/#{item_params[:image].original_filename}"
    # end

    # if @item.save
    if @item.update(item_params)
      redirect_to root_path, flash: { notice: t('notice.update_item') }
    else
      render 'edit'
      # redirect_to root_path, flash: { alert: "ERREUR modif item !!!" }
    end
  end

  private

  def item_params # a partir de Rails 4
    params.require(:item).permit(:titre, :contenu, :image, :slug, :user_id)
  end
end
