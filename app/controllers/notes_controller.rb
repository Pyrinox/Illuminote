class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # def tag_params
  #   params.require(:tag).permit(:new_tag_list)
  # end

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    #@note = Note.new(note_params)
  
    puts "hello"
    puts note_params["content"]
    puts "goodbye"
    
    # #parse through content here note_params[:content]
    # # :label, :content, :time_stamp, :index, :level, :parent_id
    
    @note = Note.new({
        label: "test", 
        content: note_params["content"], 
        time_stamp: DateTime.now.to_date, 
        index: 1, 
        level: 1, 
        parent_id: -1
      })
      
    puts @jsParam

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        puts "fail"
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:label, :content, :time_stamp, :index, :level)
    end
end
