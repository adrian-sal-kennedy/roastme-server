# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  context 'routes' do
    it 'should route POST /signup to #create' do
      should route(:post, '/signup').to(action: :create)
    end

    it 'should route GET /user/:id to #show' do
      should route(:get, '/user/1').to(id: '1', action: :show)
    end
  end
end
