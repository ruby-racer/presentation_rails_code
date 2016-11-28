module ApplicationHelper
  def interval_or_one_date(object)
    if object.start_date.present? && object.end_date.present?
      "#{object.start_date.strftime('%d/%m/%Y')} - #{object.end_date.strftime('%d/%m/%Y')}"
    else
      "#{object.start_date.try(:strftime, '%d/%m/%Y')}#{object.end_date.try(:strftime, '%d/%m/%Y')}"
    end
  end
end
