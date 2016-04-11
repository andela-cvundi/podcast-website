class UsersController < ApplicationController
    before_action :find_user, only: [:show, :dashboard]
    before_action :find_episode, only: [:show, :dashboard]
    
    def index
        @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
    end
    
    
    def show
    end
    
    def dashboard
        @episodes = current_user.episodes.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    end
    
    private
    
    def find_user
        if params[:id].nil?
            @user = current_user
        else
            @user = User.find(params[:id])
        end
    end
    
    def find_episode
        @episodes = @user.episodes.paginate(:page => params[:page], :per_page => 5)
    end
end
