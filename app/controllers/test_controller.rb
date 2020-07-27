class TestController < ApplicationController
    def test
        render json: {name: "guy", age: 20}
    end
end
