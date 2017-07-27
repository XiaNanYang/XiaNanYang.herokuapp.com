$("#places").replaceWith "<%= escape_javascript(render 'items_list', items: @places) %>"
