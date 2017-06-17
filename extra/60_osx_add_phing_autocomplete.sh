# ----------------------------------------
# ADD PHING AUTOCOMPLETION
# ----------------------------------------

cat <<EOT >> /etc/bash_completion.d/phing
_phing () {
    local cur prev

    COMPREPLY=()
    buildfile=build.xml
    _get_comp_words_by_ref cur prev

    [ ! -f $buildfile ] && return 0

    COMPREPLY=( $( compgen -W "$( phing -l | tr -s '\-' | sed s/^-/\|/ | tr -d '\|' \
        | sed s/\ \ .*\// \
        | sed s/Buildfile.*// | sed s/Default\ target:// | sed s/Subtargets:// \
        | sed s/Main\ targets:// \
        | tr -s ' ' \
        | sed 's/[^[:print:]]//g' | sed s/\\[.*// | tr '\n' ' ' | tr -s '\n' 2>/dev/null )" \
        -- "$cur" ) )
}

complete -F _phing phing
EOT
