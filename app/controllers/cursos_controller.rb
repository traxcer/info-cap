class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = current_user.cursos.build
  end

  # GET /cursos/1/edit
  def edit
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = current_user.cursos.build(curso_params)

      if @curso.save
        redirect_to @curso, notice: 'El Curso se ha creado.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
      if @curso.update(curso_params)
        redirect_to @curso, notice: 'Curso se ha actualizado.'
      else
        render action: 'edit'
      end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
      redirect_to cursos_url, notice: 'Curso se ha destruido.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:tipo, :comienzo, :final, :turno, :lugar, :cierre)
    end

  def correct_user
    @curso = current_user.cursos.find_by(id: params[:id])
    redirect_to cursos_path, notice: 'No está autorizado a modifica éste curso' if curso.nil?
  end

end
