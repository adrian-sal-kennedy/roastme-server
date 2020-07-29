# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'routes' do
    it 'should route GET /dashboard to #index' do
      should route(:get, '/dashboard').to(action: :index)
    end
  end
end
