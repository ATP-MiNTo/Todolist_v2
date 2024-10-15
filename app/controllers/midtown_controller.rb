class MidtownController < ApplicationController
    def home
        @categos = Catego.all
        @tasks = Task.all
    end
end
