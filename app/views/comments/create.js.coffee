$("#new_comment").replaceWith "<%= escape_javascript(render 'items', commentable: @commentable, items: [@comment]) %>"
