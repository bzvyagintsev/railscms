class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :filter, captcha: true

  def headers
    {
      :subject => "Сообщение с сайта",
      :to => Settings['base.email'],
      :from => Settings['base.email']
    }
  end
end
