# frozen_string_literal: true

class TestController < ApplicationController
  before_action :get_roll
  def test
    # render json: {name: "guy", age: 20}
    render json: @rickroll
  end

  def recipe
    render json: {
      recipe: {
        ingredients: {
          "butter": 50,
          "milk": 20
        }
      },
      rickroll: JSON.stringify(@rickroll)
    }
  end

  private

  def get_roll
    @rickroll = JSON.parse(File.read('public/rickroll.json'))
  end
end
