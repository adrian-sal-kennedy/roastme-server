# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  context 'routes' do
    it 'should route GET /profile to #index' do
      should route(:get, '/profile').to(action: :index)
    end
  end
end
