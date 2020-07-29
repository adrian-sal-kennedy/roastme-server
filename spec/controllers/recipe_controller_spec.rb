# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeController, type: :controller do
  context 'routes' do
    it 'should route GET /recipe/:id to #show' do
      should route(:get, '/recipe/1').to(action: :show, id: 1)
    end

    it 'should route POST /recipe to #create' do
      should route(:post, '/recipe').to(action: :create)
    end

    it 'should route PATCH /recipe/:id to #show' do
      should route(:patch, '/recipe/1').to(action: :update, id: 1)
    end

    it 'should route DELETE /recipe/:id to #create' do
      should route(:delete, '/recipe/1').to(action: :delete, id: 1)
    end
  end
end
