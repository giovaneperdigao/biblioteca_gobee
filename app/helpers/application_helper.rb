module ApplicationHelper

  def helper_busca url, params
    "<div class=busca>
      #{form_tag(url, params) do
        concat(text_field_tag('campo_busca'))
        concat(submit_tag('Buscar'))
      end}
    </div>".html_safe
  end
end
