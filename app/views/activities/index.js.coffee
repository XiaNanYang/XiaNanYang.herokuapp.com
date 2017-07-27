$("#activities").replaceWith "<%= escape_javascript(render 'items', items: @activities) %>"
