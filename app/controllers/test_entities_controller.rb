class TestEntitiesController < ApplicationController
  def index
    @entities = TestEntity.all
  end

  def new
    @entity = TestEntity.new
  end

  def create
    @entity = TestEntity.new(entities_params)
    if @entity.save
      redirect_to test_entities_path
    else
      render :new
    end
  end

  private

  def entities_params
    params[:test_entity].permit!
  end
end
