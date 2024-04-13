class AccountAwardsController < ApplicationController
  before_action :set_account_award, only: [:show, :edit, :update, :destroy]

  def index
    @q = AccountAward.ransack(params[:q])
    @account_awards = @q.result.includes(:account, :award).page(params[:page])
  end

  def show
  end

  def new
    @account_award = AccountAward.new
    @accounts = Account.all
    @awards = Award.all
  end

  def create
    if account_award_params[:account_id].blank? || account_award_params[:award_id].blank?
      @accounts = Account.all
      @awards = Award.all
      flash.now[:alert] = 'You must select both an account and an award.'
      render :new, status: :unprocessable_entity
    else
      AddAwardToMemberJob.perform_later(account_award_params)
      redirect_to account_awards_path, notice: 'The award is being added to the member. This might take a few moments.'
    end
  end

  def edit
    @accounts = Account.all
    @awards = Award.all
  end

  def update
    if @account_award.update(account_award_params)
      redirect_to account_awards_path, notice: 'Award was successfully updated for the member.'
    else
      @accounts = Account.all
      @awards = Award.all
      render :edit
    end
  end

  def destroy
    @account_award.destroy
    redirect_to account_awards_path, notice: 'Award assignment was successfully removed.'
  end

  private

  def set_account_award
    @account_award = AccountAward.find(params[:id])
  end

  def account_award_params
    params.require(:account_award).permit(:account_id, :award_id)
  end
end
