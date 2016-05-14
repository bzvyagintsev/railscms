module ApplicationHelper
  def url_for_page page
    if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end
  end

  def number_to_currency_rub price
    rub = "<i class='fa fa-rub'></i>"
    value = number_to_currency(price, separator: ".", delimiter: "", format: "%n")

    if value.present?
      return value + ' ' + rub.html_safe
    end
  end

  def active_status active
    if active
      data = "<span class='label label-success'>Включено</span>"
      data.html_safe
    else
      data = "<span class='label label-warning'>Выключено</span>"
      data.html_safe
    end
  end

  def weight_for weight
    if weight
      weight.to_s + ' ' + 'кг'
    end
  end

  def v_for v
    if v
      (v.to_s + ' ' + 'м<sup>3</sup>').html_safe
    end
  end

end
