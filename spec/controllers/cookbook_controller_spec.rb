# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CookbookController, type: :controller do
  context 'routes' do
    it 'should route GET /cookbook to #index' do
      should route(:get, '/cookbook').to(action: :index)
    end
  end
end
