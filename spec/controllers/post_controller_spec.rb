# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostController, type: :controller do
  context 'routes' do
    it 'should route GET /post/:id to #show' do
      should route(:get, '/post/1').to(action: :show, id: 1)
    end

    it 'should route POST /post to #create' do
      should route(:post, '/post').to(action: :create)
    end

    it 'should route PATCH /post/:id to #show' do
      should route(:patch, '/post/1').to(action: :update, id: 1)
    end

    it 'should route DELETE /post/:id to #create' do
      should route(:delete, '/post/1').to(action: :delete, id: 1)
    end
  end
end
