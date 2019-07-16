#!/bin/bash

JAVA_HOMES_DIR="$HOME/applications"
JROCKIT_HOME="$JAVA_HOMES_DIR/jrockit6"
export DEFAULT_JAVA_HOME="$JAVA_HOMES_DIR/java11"
export JAVA_HOME=$DEFAULT_JAVA_HOME
JAVA_VERSION_FILE="java_version.log"

export NO_JAVA_PATH=$PATH
export PATH="$JAVA_HOME/bin:$PATH"
change_java() {
    OLD_JAVA_HOME=$JAVA_HOME
    OLD_JAVA=$(get_java)
    NEW_JAVA_HOME=$1
    if [ -z "$OLD_JAVA_HOME" ]; then
        NEWPATH=$NEW_JAVA_HOME/bin:$PATH
    elif echo $PATH | grep -q $OLD_JAVA_HOME; then
        NEWPATH=$(echo $PATH | sed "s#$OLD_JAVA_HOME#$1#")
    else
        NEWPATH=$NEW_JAVA_HOME/bin:$PATH
    fi

    shift 1
    if [[ $# = 0 ]]; then
        export PATH=$NEWPATH
        export JAVA_HOME=$NEW_JAVA_HOME
    else
        PATH=$NEWPATH JAVA_HOME=$1 $@
    fi
    NEW_JAVA=$(get_java)
    export LP_PS1_PREFIX=$(echo $LP_PS1_PREFIX | sed "s/$OLD_JAVA/$NEW_JAVA/" )
}

get_java() {
    if [ -n "$JAVA_HOME" ]
    then
        echo "($(basename $JAVA_HOME))"
    elif command -v java &> /dev/null; then 
        echo  "($(java -version 2>&1 | awk ' BEGIN { FS = "\"" } ; /version/ {print $2}'))"
    else
        echo "(no java)"
    fi
}

for j in $JAVA_HOMES_DIR/java*
do
    alias $(basename $j)="change_java $j"
done

alias jrockit="change_java $JROCKIT_HOME"

java_cd() {
    local version=""
    DIR="$(builtin cd "$1" &>/dev/null && pwd)"
    if [ $? = 0 ];
    then
        while [[ "$DIR" != "/" && -z $version ]]; do
            if [[ -f "$DIR/$JAVA_VERSION_FILE" ]]; then
                version=$(cat "$DIR/$JAVA_VERSION_FILE" 2>/dev/null)
                [[ -n "$version" ]] && change_java $JAVA_HOMES_DIR/$(cat $DIR/java_version.log)
            fi
            DIR="$(dirname "$DIR")"
        done
        if [[ ! -n "$version" ]];
        then
            change_java $DEFAULT_JAVA_HOME
        fi
    fi
}

export LP_PS1_PREFIX="$(get_java)$LP_PS1_PREFIX"
export PS1="\$(get_java)$PS1"

unjava() {
    OLD_JAVA_HOME=$JAVA_HOME
    OLD_JAVA="$(get_java)"
    if echo $PATH | grep -q $OLD_JAVA_HOME; then
        NEWPATH=$(echo $PATH | sed "s#$OLD_JAVA_HOME##")
    fi
    export PATH=$NEWPATH
    export JAVA_HOME=
    export LP_PS1_PREFIX=$(echo $LP_PS1_PREFIX | sed "s/$OLD_JAVA/$(get_java)/")
}
