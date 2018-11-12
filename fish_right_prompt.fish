# Right prompt for agnoster theme

function fish_right_prompt
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555

  if test -n "$AWS_ROLE_NAME" -a -n "$AWS_SESSION_DURATION" -a -n "$AWS_SESSION_START_TIME"
    set diff (math $AWS_SESSION_DURATION - (math (date +%s) - $AWS_SESSION_START_TIME))

    if math "$diff>0" > /dev/null
      echo "["$AWS_ROLE_NAME"|"$diff"s] "
    else
      aws-clear
    end
  end

  date "+%H:%M:%S"

  if test $fish_show_command_line_fish_icon = true
    echo " "🐟" "
  end

  set_color normal
end
