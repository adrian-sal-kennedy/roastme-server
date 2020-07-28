class FollowController < ApplicationController
    before_action :authenticate_user

    def list
        following = []
        count = 0
        current_user.following.users.each do |user|
            following << user
            count += 1
        end
        render json: {users: following, total: count}
    end

    def follow
        skip = false
        current_user.following.followings_users.where(user_id: params[:id]).each do |user|
            skip = true
        end
        if skip == false
            new_follow = current_user.following.followings_users.new(user_id: params[:id])
            if new_follow.save
                render json: {user: current_user.id, following: params[:id], followed: true}
            else
                render json: {user: current_user.id, following: params[:id], followed: false}
            end
        else
            render json: {user: current_user.id, following: params[:id], followed: true, skipped: true}
        end
    end

    def unfollow
        match = false

        current_user.following.followings_users.where(user_id: params[:id]).each do |follow|
            follow.delete
            match = true
        end

        if match == true
            render json: {user: current_user.id, following: params[:id], unfollowed: true}
        else
            render json: {user: current_user.id, following: params[:id], unfollowed: false}
        end
    end

    def following?
        following = false
        current_user.following.followings_users.where(user_id: params[:id]).each do |follow|
            following = true
        end    

        if following == true 
            render json: {user: current_user.id, following: params[:id], followed: true}
        else
            render json: {user: current_user.id, following: params[:id], followed: false}
        end
    end
end
