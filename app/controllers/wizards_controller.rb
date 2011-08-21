class WizardsController < ApplicationController
  respond_to :html, :json

  # GET /wizards
  # GET /wizards.json
  def index
    @wizards = Wizard.all

    respond_with(@wizards)
  end

  # GET /wizards/1
  # GET /wizards/1.json
  def show
    @wizard = Wizard.find(params[:id])

    respond_with(@wizard)
  end

  # GET /wizards/new
  # GET /wizards/new.json
  def new
    @wizard = Wizard.new

    respond_with(@wizard)
  end

  # GET /wizards/1/edit
  def edit
    @wizard = Wizard.find(params[:id])

    respond_with(@wizard)
  end

  # POST /wizards
  # POST /wizards.json
  def create
    @wizard = Wizard.create(params[:wizard])

    respond_with(@wizard, notice: "Wizard was successfully created.")
  end

  # PUT /wizards/1
  # PUT /wizards/1.json
  def update
    @wizard = Wizard.find(params[:id])
    @wizard.update_attributes(params[:wizard])

    respond_with(@wizard, notice: "Wizard was successfully updated.")
  end

  # DELETE /wizards/1
  # DELETE /wizards/1.json
  def destroy
    @wizard = Wizard.find(params[:id])
    @wizard.destroy

    respond_with(@wizard, notice: "Wizard was successfully deleted.")
  end
end
