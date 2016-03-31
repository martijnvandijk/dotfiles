#! /bin/bash

padding="    "

taskicon() {
  tree=$(bspc query -T --desktop $name)

  case $tree in
    *"streaming_client"*)
      echo -e "%{T5}\uf35e%{T1}"
      ;;
    *"clion"*)
      echo -e "%{T4}\uf138%{T1}"
      ;;
    *"Atom"*)
      echo -e "%{T4}\uf13a%{T1}"
      ;;
    *"Subl3"*)
      echo -e "%{T4}\uf13a%{T1}"
      ;;
    *"Steam"*)
      echo -e "%{T4}\uf35e%{T1}"
      ;;
    *"Discord"*)
      echo -e "%{T5}\uf419%{T1}"
      ;;
    *"Firefox"*)
      echo -e "%{T5}\uf61c%{T1}"
      ;;
    *"chromium"*)
      echo -e "%{T5}\uf61c%{T1}"
      ;;
    *"Telegram"*)
      echo -e "%{T4}\uf266%{T1}"
      ;;
    *"Thunderbird"*)
      echo -e "%{T4}\uf15a%{T1}"
      ;;
    *"Sakura"*)
      echo -e "%{T5}\uf25e%{T1}"
      ;;
    *)
      echo "$name"
      ;;
  esac
}

while read -r line ; do

  case $line in
    A* )
      title=$(xprop -id ${line#?} | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
      ;;
    W* )
      # bspwm internal state
      wm_var=""
      monitor_primary="%{S1}"
      monitor_left="%{S0}"
      monitor_right="%{S2}"

      IFS=':'
      set -- ${line#?}
      while [ $# -gt 0 ] ; do
        item=$1
        name=${item#?}
        case $item in
          *DVI-I-1)
            wm_var=$monitor_primary
            ;;
          *HDMI_0)
            wm_var=$monitor_left
            ;;
          *HDMI_1)
            wm_var=$monitor_right
            ;;
          O*)
            # focused occupied desktop
            workspace_string="%{A: bspc desktop -f ${name}:}%{U#FFFFFF}%{+u}$padding$(taskicon)$padding%{-u}%{A}"
            wm_var="$wm_var $workspace_string"
            ;;
          F*)
            # focused free desktop
            workspace_string="%{A: bspc desktop -f ${name}:}%{U#FFFFFF}%{+u}$padding${name}$padding%{-u}%{A}"
            wm_var="$wm_var $workspace_string"
            ;;
          U*)
            # focused urgent desktop
            workspace_string="%{A: bspc desktop -f ${name}:}%{U#FFFFFF}%{+u}$padding$(taskicon)$padding%{-u}%{A}"
            wm_var="$wm_var $workspace_string"
            ;;
          o*)
            # occupied desktop
            workspace_string="%{A: bspc desktop -f ${name}:}$padding$(taskicon)$padding%{A}"
            wm_var="$wm_var $workspace_string"
            ;;
          f*)
            # free desktop
            workspace_string="%{A: bspc desktop -f ${name}:}%{F#AAFFFFFF}$padding${name}$padding%{F-}%{A}"
            wm_var="$wm_var $workspace_string"
            ;;
          u*)
            # urgent desktop
            workspace_string="%{A: bspc desktop -f ${name}:}$padding$(taskicon)$padding%{A}"
            wm_var="$wm_var $workspace_string"
            ;;
        esac
        shift
      done
      ;;
    C* )
      clock="${line#?}"
      ;;
    R* )
      redshift_status="${line#?}"
      ;;
    V* )
      volume="${line#?}"
      ;;
    L* )
      load="${line#?}"
      ;;
    U* )
      updates="${line#?}"
      ;;
    D* )
      desktops="${line#?}"
      ;;
    N* )
      kilobytes=$(echo "scale=0; (${line#?}-${allbytes:-0})/1024" | bc -l)
      allbytes="${line#?}"
      if [ $kilobytes -ge 1024 ]; then
        megabytes=$(echo "scale=2; ${kilobytes}/1024" | bc -l)
        network="   %{T5}\uf3d0 %{T3}$megabytes Mb/s"
      else
        network="   %{T5}\uf3d0 %{T3}$kilobytes Kb/s"
      fi
      ;;
  esac

  echo -e "%{S1} $wm_var   $title%{c}$clock%{r}$updates$volume$network  $load$redshift_status  "

done
