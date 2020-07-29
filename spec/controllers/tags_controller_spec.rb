# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  context 'routes' do
    it 'should route GET /tags to #list' do
      should route(:get, '/tags').to(action: :list)
    end

    it 'should route POST /tags to #create' do
      should route(:post, '/tags/1').to(action: :create, id: 1)
    end
  end
end
