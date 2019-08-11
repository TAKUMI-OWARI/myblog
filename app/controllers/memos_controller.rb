class MemosController < ApplicationController

  def index
    @memos = Memo.order("created_at DESC").all
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
    redirect_to action: :index
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)
    redirect_to action: :index
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to action: :index
  end

  def all_destroy
    Memo.delete_all
    redirect_to action: :index
  end

  private 
  def memo_params
    params.require(:memo).permit(:content)
  end
end
