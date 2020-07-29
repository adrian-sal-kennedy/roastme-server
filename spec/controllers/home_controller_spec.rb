# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context 'routes' do
    it 'should route GET / to #index' do
      should route(:get, '/').to(action: :index)
    end
  end
end
