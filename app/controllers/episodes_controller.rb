class EpisodesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authorized_user
  before_action :find_user
  before_action :find_episode, only: [:show, :edit, :update, :destroy]
  
  def new
    @episode = @user.episodes.new
  end
  
  def create
    @episode = @user.episodes.new episode_params
    if @episode.save 
      redirect_to user_episode_path(@user, @episode)
    else
      render 'new'
    end
  end
  
  
  def show
    @episodes = @user.episodes.order("created_at DESC").reject { |e| e.id == @episode.id }
  end
  
  def edit 
  end
  
  def update
    if @episode.update episode_params
      redirect_to user_episode_path(@user, @episode), notice: "Episode updated successfully"
    else
      render 'edit'
    end
  end
  
  
  def destroy
    @episode.destroy
    redirect_to root_path
  end
  
  private 
  
  def episode_params
    params.require(:episode).permit(:title, :description)
  end
  
  def find_user
    @user = User.find(params[:user_id])
  end
  
  def find_episode
    @episode = Episode.find(params[:id])
  end
  
  def authorized_user
    @user = User.find(params[:user_id])
    if current_user != @user
      redirect_to root_path, notice: "You are not allowed to perform this action"
    end
  end
end
