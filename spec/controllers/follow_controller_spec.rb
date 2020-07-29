# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowController, type: :controller do
  context 'routes' do
    it 'should route GET /follow/:id to #follow' do
      should route(:get, '/follow/1').to(action: :follow, id: 1)
    end

    it 'should route DELETE /follow/:id to #unfollow' do
      should route(:delete, '/follow/1').to(action: :unfollow, id: 1)
    end

    it 'should route GET /follow to #list' do
      should route(:get, '/follow').to(action: :list)
    end

    it 'should route GET /following/:id to #following?' do
      should route(:get, '/following/1').to(action: :following?, id: 1)
    end
  end
end
