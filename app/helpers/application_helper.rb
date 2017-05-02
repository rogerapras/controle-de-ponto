module ApplicationHelper

  def get_time_label_from_number(index)
    "#{type_label(index)} #{number_label(index)}"
  end

  def get_color_balance(balance)
    return 'success' if balance.cleared? || balance.positive?

    'danger'
  end

  def get_icon_balance(balance)

    if balance.cleared?
      return 'fa-check-circle'
    elsif balance.positive?
      return 'fa-plus-circle'
    end

    'fa-minus-circle'
  end

  def get_dashboard_color(balance)
    return 'infobox-green' if balance.cleared? || balance.positive?

    'infobox-red'
  end

  def flash_class(type)
    flashes[type]['class']
  end

  def flash_icon(type)
    flashes[type]['icon']
  end

  def display_labor_laws_violations(day, account)
    return unless account.class == CltWorkerAccount
    (render 'day_records/labor_law_violation', violations: day.labor_laws_violations).html_safe
  end

  def save_and_add_text(obj)
    action = obj.new_record? ? 'create' : 'update'
    save_text = t("helpers.submit.#{action}", model: obj.model_name.human)
    "#{save_text} #{t('helpers.submit.and_add')}"
  end

  def format_seconds_to_time(total)
    mm, _ss = total.divmod(60)
    hour, minute = mm.abs.divmod(60)
    '%02d:%02d' % [hour.abs, minute.abs]
  end

  private

  def type_label(index)
    index % 2 == 0 ? 'Entrada' : 'Saída'
  end

  def number_label(index)
    ((index + 1) / 2.to_f).ceil
  end

  def flashes
    @flashes ||= {
      'success' => class_and_icon('success', 'fa-check'),
      'error'   => class_and_icon('danger', 'fa-ban'),
      'notice'  => class_and_icon('info', 'fa-info'),
      'alert'   => class_and_icon('warning', 'fa-exclamation-triangle')
    }
  end

  def class_and_icon(css_class, icon)
    {
      'class' => css_class,
      'icon' => icon
    }
  end

end
