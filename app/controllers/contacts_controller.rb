class ContactsController < ApplicationController
  def new
    prepare_meta_tags title: ' | Контакты', description: ' | Контакты'

    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])


    respond_to do |format|
      if @contact.deliver
        format.html { redirect_to contacts_path, :flash => { success: "Сообщение успешно отправлено"} }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end

    # respond_to do |format|
    # 	 html = render_to_string(template: 'contacts/_success.html.erb',
    #                 formats: ["html"], layout: false)

    # 	format.json { render json: { html: html }, layout: false }
    # end

  end
end
