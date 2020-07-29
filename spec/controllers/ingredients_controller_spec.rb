# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  context 'routes' do
    it 'should route GET /ingredients to #list' do
      should route(:get, '/ingredients').to(action: :list)
    end

    it 'should route POST /ingredients/:id to #create' do
      should route(:post, '/ingredients/1').to(action: :create, id: 1)
    end
  end
end
