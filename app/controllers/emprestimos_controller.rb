class EmprestimosController < ApplicationController
  def index
    @emprestimos = Emprestimo.all
  end

  def new
    @emprestimo = Emprestimo.new
    @alunos = Aluno.sem_livros
    @livros = Livro.disponiveis
  end

  def create
    @emprestimo = Emprestimo.new(emprestimo_params)
    @emprestimo.data_emprestimo = Date.today

    respond_to do |format|
      if @emprestimo.save
        format.html { redirect_to emprestimos_url, notice: 'Emprestimo criado com sucesso.' }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        format.html { render :new }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @emprestimo = Emprestimo.find(params[:id])

    respond_to do |format|
      if @emprestimo.devolver!
        format.html { redirect_to emprestimos_url, notice: 'Devolução efetuada com sucesso.' }
        format.json { render :index, status: :created, location: @emprestimo }
      else
        format.html { render :new }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_params
      params.require(:emprestimo).permit(:aluno_id, :livro_id)
    end
end
