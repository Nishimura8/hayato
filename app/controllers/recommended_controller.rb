class RecommendedController < ApplicationController
    def index
        @reco = Recommended.all
    end
end
