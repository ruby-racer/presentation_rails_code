module ImagesHelper
  def sprite_tag(filename, options = {})
    "<svg class='#{options[:classes]}'><use xlink:href='##{filename}'/></svg>".html_safe
  end

  def inline_svg(filename)
    file = File.open("app/assets/images/#{filename}", 'rb') { |file| raw file.read }
    "<div class='hide'>#{file}</div>".html_safe
  end

  def image_set_tag(source, srcset = {}, options = {})
    srcset = srcset.map { |src, size| "#{image_path(src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end

  def freeflow_image_class(index)
    case index
    when 2, 4
      'individualSection-item--large js-item-large'
    when 7
      'individualSection-item--medium js-item-medium'
    when 1, 3, 8
      'individualSection-item--small js-item-small'
    end
  end
end
