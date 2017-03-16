class ChroniclesController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @chronicle_match = Chronicle.all.sort_by {|chron| chron.downvotes - chron.upvotes }
  end

  def new
    @chronicle = Chronicle.new
  end

  def create
    @chronicle = Chronicle.create(chronicle_params)
    @chronicle.admin_id = current_account.id
    @chronicle.save
    if @chronicle
      Subscription.create(account_id: current_account.id, chronicle_id: @chronicle.id)
      if !params[:chronicle][:tags].blank?
        params[:chronicle][:tags].each do |tag|
          @tag = Tag.find_or_create_by(name: tag.downcase)
          @chronicle.tags << @tag
        end
      end
      redirect_to account_path(current_account)
    else
      render 'new'
    end
  end

  def show
    @chronicle = Chronicle.find(params[:id])
    @comment = Comment.new
    @chronicle_vote = ChronicleVote.new
    @comment_vote = CommentVote.new
  end

  def edit
    @chronicle = Chronicle.find(params[:id])
    if @chronicle.admin_id != current_account.id
      flash[:notice] = "You are not an admin of this chronicle"
      redirect_to account_path(current_account)
    end
  end

  def update

    @chronicle = Chronicle.find(params[:id])
    @chronicle.update(chronicle_params)
    if !params[:chronicle][:tags].blank?
      params[:chronicle][:tags].each do |tag|
        @tag = Tag.find_or_create_by(name: tag.downcase)
        @chronicle.tags << @tag
      end
    end
    redirect_to chronicle_path(@chronicle)
  end

  def destroy
    @chronicle= Chronicle.find(params[:id])
    @chronicle.destroy
  end

  private
    def chronicle_params
      params.require(:chronicle).permit(:name, :description, :private,  :admin_id)
    end


end
