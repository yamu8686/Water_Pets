class Admin::CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def show
  end

  def edit
  end
end
