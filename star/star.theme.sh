#! bash oh-my-bash.module

SCM_THEME_PROMPT_PREFIX="${_omb_prompt_magenta}<"
SCM_THEME_PROMPT_SUFFIX=">${_omb_prompt_normal} "
SCM_THEME_PROMPT_DIRTY="*"
SCM_THEME_PROMPT_CLEAN=""
SCM_GIT_SHOW_MINIMAL_INFO=true

USER_MARK="»"
DIVIDER_MARK="::"

function ps_user_mark {
    if [ $(id -u) -eq 0 ]
        then
            mark_color=$_omb_prompt_red
        else
            mark_color=$_omb_prompt_blue
    fi

    _omb_util_print "${_omb_prompt_bold}${mark_color}${USER_MARK}${_omb_prompt_normal}"
}

function _omb_theme_PROMPT_COMMAND {
    ps_host="\h"
    ps_divider="${_omb_prompt_bold}${_omb_prompt_blue}${DIVIDER_MARK}${_omb_prompt_normal}"
    ps_path="${_omb_prompt_green}\W${_omb_prompt_normal}"

    PS1="$ps_host $ps_divider $ps_path $(scm_prompt_info)$(ps_user_mark) "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
