# frozen_string_literal: true

class RoutinesController < ApplicationController
  before_action :set_routine, only: %i[show edit update destroy]

  # GET /routines or /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1 or /routines/1.json
  def show; end

  # GET /routines/new
  def new
    @routine = current_user.routines.new
    @routine.routine_exercises.build
  end

  # GET /routines/1/edit
  def edit; end

  # POST /routines or /routines.json
  def create
    @routine = current_user.routines.new(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to @routine, notice: 'Routine was successfully created.' }
        format.json { render :show, status: :created, location: @routine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_exercise
    routine = Routine.new
    # routine.routine_exercises.build
    helpers.fields model: routine do |f|
      f.fields_for :routine_exercises, RoutineExercise.new, child_index: Time.now.to_f do |ff|
        render turbo_stream: turbo_stream.append(
          'routine_exercises',
          partial: 'routines/routine_exercise_fields',
          locals: { f: ff }
        )
      end
    end
  end

  def remove_exercise
    puts "remove exercise #{params}"
  end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to routine_url(@routine), notice: 'Routine was successfully updated.' }
        format.json { render :show, status: :ok, location: @routine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1 or /routines/1.json
  def destroy
    @routine.destroy

    respond_to do |format|
      format.html { redirect_to routines_url, notice: 'Routine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_routine
    @routine = Routine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def routine_params
    params.require(:routine).permit(:name, routine_exercises_attributes: {})
  end
end
